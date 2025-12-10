return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function(_, opts)
    local lint = require "lint"

    lint.linters_by_ft = vim.tbl_deep_extend(
      "force",
      lint.linters_by_ft or {},
      opts.linters_by_ft or {}
    )

    local augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
