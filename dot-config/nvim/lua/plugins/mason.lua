return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
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
      ["mason-nvim-dap"] = true,
    },
  },
}
