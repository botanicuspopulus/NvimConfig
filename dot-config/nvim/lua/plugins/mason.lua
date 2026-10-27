return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "codelldb",
        "clangd",
        "ruff",
        "basedpyright",
        "dockerfile-language-server",
        "marksman",
        "svelte-language-server",
      },
      run_on_start = true,
      start_delay = 3000,
      integrations = {
        ["mason-nvim-dap"] = true,
      },
    },
  },
}
