return {
  "nvimtools/none-ls.nvim",
  event = "User AstroFile",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = {
      null_ls.builtins.formatting.asmfmt,
      null_ls.builtins.formatting.cbfmt,
      null_ls.builtins.formatting.clang_format,
      null_ls.builtins.formatting.cmake_format,
      null_ls.builtins.formatting.djlint,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.prettierd.with {
        extra_args = {
          "--prose-wrap=always",
          "--embedded-language-formatting=auto",
        },
        filetypes = { "css", "html", "javascript" },
      },
      null_ls.builtins.formatting.shellharden,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.stylelint,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.tidy,
      null_ls.builtins.formatting.yamlfmt,

      null_ls.builtins.diagnostics.ansiblelint,
      null_ls.builtins.diagnostics.checkmake,
      null_ls.builtins.diagnostics.cmake_lint,
      null_ls.builtins.diagnostics.cppcheck,
      null_ls.builtins.diagnostics.djlint,
      null_ls.builtins.diagnostics.dotenv_linter,
      null_ls.builtins.diagnostics.editorconfig_checker,
      null_ls.builtins.diagnostics.gccdiag,
      null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.diagnostics.selene,
      null_ls.builtins.diagnostics.stylelint,
      null_ls.builtins.diagnostics.tidy,
      null_ls.builtins.diagnostics.yamllint,

      null_ls.builtins.code_actions.refactoring,
    }

    return opts
  end,
}
