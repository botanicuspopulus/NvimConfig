return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.asmfmt,
          null_ls.builtins.formatting.cbfmt,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.cmake_format,
          null_ls.builtins.formatting.djlint,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.markdownlint,
          null_ls.builtins.formatting.prettierd,
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
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.selene,
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.diagnostics.tidy,
          null_ls.builtins.diagnostics.yamllint,

          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.refactoring,

          null_ls.builtins.hover.dictionary,
        },
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end,
          })
        end,
      }
    end,
  },
}
