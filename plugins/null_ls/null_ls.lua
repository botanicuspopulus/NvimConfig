return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, config)
      local null_ls = require "null-ls"

      config.sources = {
        -- Code Actions
        -- null_ls.builtins.code_actions.cspell,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.code_actions.gitsigns,
        require "typescript.extensions.null-ls.code-actions",

        -- Completion
        null_ls.builtins.completion.tags,

        -- Diagnostics
        -- null_ls.builtins.diagnostics.cspell,
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.eslint_d.with {
          extra_args = { "--cache" },
        },
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.pydocstyle,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.zsh,

        -- Formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.json_tool,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.nginx_beautifier,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.formatting.stylua.with {
          extra_args = {
            "--indent-type", "Spaces",
            "--indent-width", "2",
          }
        },
        null_ls.builtins.formatting.shfmt.with {
          extra_args = { "-i", "2", "-ci", "-bn" },
        },
      }
      return config
    end,
  }
}
