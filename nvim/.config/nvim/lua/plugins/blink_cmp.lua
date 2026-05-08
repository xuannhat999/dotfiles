return {
  {
    "saghen/blink.cmp",
    --- @module 'blink.cmp'
    --- @type blink.Config
    opts = {
      enabled = function()
        local ft = vim.bo.filetype
        local name = vim.api.nvim_buf_get_name(0)
        if ft == "text" or name == "" or ft == "" then
          return false
        end

        return true
      end,
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "dadbod" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
          mysql = { "snippets", "dadbod", "buffer" },
          sqlite = { "snippets", "dadbod", "buffer" },
          postgresql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
        },
      },
    },
  },
}
