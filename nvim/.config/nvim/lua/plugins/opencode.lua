return {
  "nickjvandyke/opencode.nvim",
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type for details
    }

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ")
    end, { desc = "Ask OpenCode…" })
    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      require("opencode").select()
    end, { desc = "Select OpenCode…" })
    -- vim.keymap.set({ "n", "x" }, "<leader>or", function()
    --   return require("opencode").operator("@this")
    -- end, { desc = "Send range to OpenCode", expr = true })
    -- vim.keymap.set({ "n" }, "<leader>or", function()
    --   return require("opencode").operator("@this") .. "_"
    -- end, { desc = "Send line to OpenCode", expr = true })
  end,
}
