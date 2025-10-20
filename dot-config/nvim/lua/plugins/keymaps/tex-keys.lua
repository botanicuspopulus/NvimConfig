return {
  {
    "lervag/vimtex",
    keys = {
      { "<localleader>l", "", "desc", ft = "text" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          keys = {
            { " <leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      },
    },
  },
}
