return {
  { "bkad/CamelCaseMotion", lazy = false },
  { "wellle/targets.vim", lazy = false },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {
      search = {
        multi_window = true,
        forward = true,
        wrap = true,
        mode = 'exact',
        incremental = true,
        exclude = {
          'notify',
          'noice',
          'cmp_menu',
          function(win)
            return not vim.api.nvim_win_get_config(win).focusable
          end
        },
      },
      jump = {
        jumplist = true,
        pos = 'start',
        history = false,
        register = false,
        nohlsearch = true,
        autojump = false
      },
      modes = {
        search = {
          enabled = true,
          highlight = { backdrop = false },
          jump = { history = true, register = true, nohlsearch = true },
          search = {},
        },
        char = {
          enabled = false,
          keys = { 'f', 'F', 't', 'T', ',' },
          search = { wrap = false },
          highlight = { backdrop = true },
          jump = { register = false },
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").jump() end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search",
      },
    },
  },
}
