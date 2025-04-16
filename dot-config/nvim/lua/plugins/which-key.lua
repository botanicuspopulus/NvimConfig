return {
  "folke/which-key.nvim",
  config = function(_, opts)
    local wk = require "which-key"
    opts = {
      preset = "modern",
      plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = true, suggestions = 20 },
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
      icons = {
        mappings = false,
        breadcrumb = "󰄾",
        separator = "  ",
        group = "󰐕 ",
        colors = false,
      },

      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      disable = { ft = { "help", "dashboard" }, bt = { "terminal" } },
    }
    wk.setup(opts)
  end,
}
