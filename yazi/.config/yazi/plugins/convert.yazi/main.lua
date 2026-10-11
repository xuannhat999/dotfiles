local function file_exists(filename)
	local f = io.open(filename, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function info(content)
	return ya.notify({
		title = "Convert",
		content = content,
		timeout = 5,
	})
end

local function has_value(val)
	val = val:lower()
	local tab = { ".jpg", ".png", ".webp", ".jpeg", ".heic", ".HEIC" }
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local selected_or_hovered = ya.sync(function()
	local tab, paths = cx.active, {}
	for _, f in pairs(tab.selected) do
		paths[#paths + 1] = tostring(f.url)
	end
	if #paths == 0 and tab.current.hovered then
		paths[1] = tostring(tab.current.hovered.url)
	end
	return paths
end)

return {
	entry = function(self, job)
		local destination_extension = job.args.extension
		if destination_extension == nil then
			destination_extension = ".jpg"
		elseif string.sub(destination_extension, 1, 1) ~= "." then
			destination_extension = "." .. destination_extension
		end
		local urls = selected_or_hovered()
		local converted = 0
		for _, source in pairs(urls) do
			local source_extension = source:match("^.+(%..+)$")
			if source_extension ~= nil then
				local source_extension_lower = source_extension:lower()
				if source_extension_lower ~= destination_extension:lower() and has_value(source_extension_lower) then
					local destination = source:sub(1, #source - #source_extension) .. destination_extension
					if file_exists(destination) then
						info(string.format("File %s already exists, skipped", destination))
					else
						local output, err = Command("magick"):arg(tostring(source)):arg(tostring(destination)):output()
						local message = ""
						if not output or err then
							message = string.format("Failed to convert from %s to %s. %s", source, destination, err)
						elseif output.stdout == "" then
							message = string.format("Converted %s to %s", source, destination)
							converted = converted + 1
						end
						info(message)
					end
				end
			end
		end
		if converted == 0 then
			info("No convertible image files found")
		end
	end,
}
