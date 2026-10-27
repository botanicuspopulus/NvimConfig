return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "debugpy" } },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug: Method", ft = "python" },
      { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug: Class", ft = "python" },
    },
    config = function()
      -- Run the adapter from mason's debugpy venv; debuggee interpreter is still auto-detected (venv/uv/etc.)
      require("dap-python").setup(vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python")
    end,
  },
}
