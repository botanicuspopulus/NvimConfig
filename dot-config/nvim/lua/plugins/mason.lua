return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "codelldb",
      },
    },
    run_on_start = true,
    start_delay = 3000,
    integrations = {
      ["mason-lspconfig"] = true,
      ["mason-null-ls"] = true,
      ["mason-nvim-dap"] = true,
    },
  },
}
