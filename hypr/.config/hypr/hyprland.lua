-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

---------------------
---- WORKSPACES -----
---------------------
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })
---------------------
---- MY PROGRAMS ----
---------------------
-- Set programs that you use
local terminal = "kitty"
local fileManager = "yazi"
local menu = "rofi"
local browser = "brave"

-------------------
---- AUTOSTART ----
-------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SSH_AUTH_SOCK")
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaybg -i ~/Pictures/Wallpapers/wallpaper1.jpg -m fill")
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("mako")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "iHD")
hl.env("XCURSOR_THEME", "Bibata_Cursor-main")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("HYPRSHOT_DIR", "Pictures/Screenshots")
hl.env("EDITOR", "nvim")
hl.env("SUDO_EDITOR", "nvim")
hl.env("GTK_THEME", "catppuccin-mocha-mauve-standard+default")

-----------------------
----- PERMISSIONS -----
-----------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons
-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(b56cffff)", "rgba(6ee9fbff)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "scrolling",
	},

	decoration = {
		rounding = 6,
		rounding_power = 5,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 2, spring = "easy", style = "popin 80%" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "easeOutQuint" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 2, bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "scroll_move",
	mods = "SUPER",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- hl.device({
-- 	name = "epic-mouse-v1",
-- 	sensitivity = -0.5,
-- })
--
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(terminal .. " bash -c -l " .. fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/powermode_switch.sh"))
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(terminal .. " bash -c -l nvim"))

-- Menu ( Rofi )
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill " .. menu .. "|| " .. menu .. " -show drun"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("pkill " .. menu .. "|| ~/.config/rofi/powermenu.sh"))

-- Wifi / Bluetooth / Audio
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/launch_impala.sh"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("~/.config/hypr/scripts/launch_wiremix.sh"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("~/.config/hypr/scripts/launch_bluetui.sh"))

-- Screen Capture ( Hyprshot )
hl.bind("PRINT", hl.dsp.exec_cmd(" hyprshot -m output -m active"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))

-- Column  (Scrolling layout)
-- Swap Column
hl.bind(mainMod .. " + period", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("swapcol l"))
-- Resize Column
hl.bind(mainMod .. " + CTRL + H", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.layout("colresize +0.1"))
-- Toggle consume
hl.bind(mainMod .. " + CTRL + period", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. " + CTRL + comma", hl.dsp.layout("consume_or_expel prev"))
-- Toggle fit
hl.bind(mainMod .. " + F", function()
	local win = hl.get_active_window()
	if not win then
		return
	end
	if tonumber(win.size.x) > 1800 then
		hl.dispatch(hl.dsp.layout("colresize 0.5"))
	else
		hl.dispatch(hl.dsp.layout("fit active"))
	end
end)
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ workspace = "e+1" }))

-- Example special workspace
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + Y", function()
	hl.dispatch(hl.dsp.workspace.toggle_special("music"))
	local windows = hl.get_windows()
	local found = false
	for _, win in ipairs(windows) do
		-- Kiểm tra class có đúng là gytm không
		if win.class == "gytm" then
			found = true
			break
		end
	end
	if not found then
		hl.dispatch(hl.dsp.exec_cmd(terminal .. " --class gytm bash -c -l gytm"))
	end
end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
-- Volume DOWN
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + F3",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)

-- Volume UP
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + F2",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

-- Mute AUDIO
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + F1",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

-- Mute MIC
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + F5",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Brightness DOWN
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl set 5%+ && ~/.config/hypr/scripts/screen_brightness.sh"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + F10",
	hl.dsp.exec_cmd("brightnessctl set 5%+ && ~/.config/hypr/scripts/screen_brightness.sh"),
	{ locked = true, repeating = true }
)

-- Brightess UP
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl set 5%- && ~/.config/hypr/scripts/screen_brightness.sh"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + F9",
	hl.dsp.exec_cmd("brightnessctl set 5%- && ~/.config/hypr/scripts/screen_brightness.sh"),
	{ locked = true, repeating = true }
)

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "system-panel",
	match = {
		class = "kitty",
		title = "^(wiremix|bluetui|impala)$",
	},
	float = true,
	size = { 800, 600 },
	stay_focused = true,
})

hl.layer_rule({
	name = "rofi",
	match = {
		namespace = "rofi",
	},
	animation = "popin 90%",
})
