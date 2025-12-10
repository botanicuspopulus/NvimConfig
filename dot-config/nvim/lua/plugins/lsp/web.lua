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
      },
    },
  },
}
