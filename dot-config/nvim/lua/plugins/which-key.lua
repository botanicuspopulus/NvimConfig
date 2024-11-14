return {
  "folke/which-key.nvim",
  config = function(_, opts)
    local wk = require("which-key")
    opts = {
      preset = "modern",
      plugins = {
        spelling  = {
          enabled = true,
          suggestions = 20,
        },
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
        spacing = 4,
        align = "center",
      },
      win = {
        no_overlap = true,
        padding = { 2, 2, 2, 2 },
      },
      show_help = true,
    }
    wk.setup(opts)
  end
}
