return {
  {
    "jay-babu/mason-null-ls.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "beautysh",
        "jsonlint",
        "luacheck",
        "mypy",
        "pydocstyle",
        "pylint",
        "sql_formatter",
        "yamlfmt",
        "yamllint",
      },
      automatic_installation = true,
    },
  }
}
