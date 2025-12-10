return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "tsx",
        "typescript",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "vtsls",
        "html-lsp",
        "css-lsp",
        "prettier",
        "stylelint",
        "emmet-language-server",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        html = { "htmlhint" },
        css = { "stylelint" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier", "htmlbeautifier" },
        ["html.handlebars"] = { "prettier" },
        ["htmlangular"] = { "prettier" },
        css = { "prettier", "stylelint" },
        scss = { "prettier", "stylelint" },
        sass = { "stylelint" },
        less = { "stylelint" },
      },
    },
  },
}
