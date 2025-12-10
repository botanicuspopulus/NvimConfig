return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "yamllint" } },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      linters_by_ft = {
        yaml = { "yamllint" },
      },
    },
  },
}
