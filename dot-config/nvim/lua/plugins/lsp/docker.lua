return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "hadolint", "yamllint" } },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
        yaml = { "yamllint" },
      },
    },
  },
}
