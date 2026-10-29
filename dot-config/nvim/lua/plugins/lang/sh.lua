-- No zsh treesitter parser; the bash one highlights most zsh constructs fine
vim.treesitter.language.register("bash", "zsh")

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "bash-language-server", "shellcheck", "shfmt", "shuck" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
      formatters = {
        shfmt = { prepend_args = { "-i", "2", "-ci", "-sr" } },
      },
    },
  },
}
