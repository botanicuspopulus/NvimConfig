return {
  {
    "zeioth/none-ls-autoload.nvim",
    event = "BufEnter",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      methods = {
        diagnostics = true,
        formatting = true,
        code_actions = true,
      },
    },
  },
}
