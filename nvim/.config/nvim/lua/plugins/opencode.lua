return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}

      vim.keymap.set({ "n", "x" }, "<leader>aa", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask OpenCode…" })
      vim.keymap.set({ "n", "x" }, "<leader>ax", function()
        require("opencode").select()
      end, { desc = "Select OpenCode…" })
      vim.keymap.set({ "n", "x" }, "<leader>ar", function()
        return require("opencode").operator("@this ")
      end, { desc = "Append range to OpenCode", expr = true })
      vim.keymap.set({ "n" }, "<leader>al", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Append line to OpenCode", expr = true })
    end,
  },
}
