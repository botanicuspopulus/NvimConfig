return {
  { "styled-components/vim-styled-components", lazy = false },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todos" },
    },
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]],
      },
    },
  },
}
