return {
  {
    "mfussenegger/nvim-dap-python",
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug: Method", ft = "python" },
      { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug: Class", ft = "python" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
      },
    },
  },
}
