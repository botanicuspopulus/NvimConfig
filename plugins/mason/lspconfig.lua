return {
  {
    "williamboman/mason-lspconfig.nvim",
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
