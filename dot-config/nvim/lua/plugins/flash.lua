return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      search = {
        multi_window = false,
        wrap = false,
      },
      highlight = {
        backdrop = false,
      },
      modes = {
        char = {
          enabled = true,
          multi_line = false,
          highlight = {
            backdrop = false,
          }
        },
      },
    },
  },
}
