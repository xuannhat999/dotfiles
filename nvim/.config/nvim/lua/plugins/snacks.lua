return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      matcher = {
        history_bonus = true,
        frecency = true,
      },
      sources = {
        files = {
          hidden = true,
          ignored = false,
        },
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
