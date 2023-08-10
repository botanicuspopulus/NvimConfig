return {
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "cssmodules_ls",
        "dotls",
        "graphql",
        "texlab",
      },
      formatting = {
        format_on_save = {
          enabled = true,
          allow_filetypes = {

          }
        }
      }
    },
  }
}
