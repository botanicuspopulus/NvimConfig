return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "vtsls",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "stylelint",
        "emmet-language-server",
        "htmlhint",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        html = {},
        css = { "stylelint" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettierd" },
        ["html.handlebars"] = { "prettierd" },
        ["htmlangular"] = { "prettierd" },
        css = { "prettierd", "stylelint" },
        scss = { "prettierd", "stylelint" },
        javascript = { "biome", "prettierd", stop_after_first = true },
        javascriptreact = { "biome", "prettierd", stop_after_first = true },
        typescript = { "biome", "prettierd", stop_after_first = true },
        typescriptreact = { "biome", "prettierd", stop_after_first = true },
        svelte = { "prettierd" },
        sass = { "stylelint" },
        less = { "stylelint" },
      },
      formatters = {
        -- Only use biome in projects that configure it
        biome = { require_cwd = true },
      },
    },
  },
}
