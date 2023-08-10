return {
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<leader>ut", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Toggle trouble" },
      { "<leader>fd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggle trouble for document" },
    },
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
    tag = "legacy",
    event = 'LspAttach',
    opts = {},
  },
  {
    "anuvyklack/fold-preview.nvim",
    lazy = false,
    dependencies = "anuvyklack/keymap-amend.nvim",
    opts = {},
  },
  {
    "anuvyklack/pretty-fold.nvim",
    lazy = false,
    opts = {},
  },
}
