local trouble_prefix = "<leader>x"
return {
  {
    "folke/trouble.nvim",
    keys = {
      {
        trouble_prefix .. "x",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Trouble: Diagnostics",
      },
      {
        trouble_prefix .. "X",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Trouble: Buffer Diagnostics (Trouble)",
      },
      {
        trouble_prefix .. "s",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Trouble: Symbols",
      },
      {
        trouble_prefix .. "l",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "Trouble: LSP Definitions/References",
      },
      {
        trouble_prefix .. "L",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Trouble: Location List",
      },
      {
        trouble_prefix .. "Q",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Trouble: Quickfix List",
      },
      {
        trouble_prefix .. "e",
        "<cmd>Trouble diagnostics toggle focus=false filter.severity=vim.diagnostic.severity.ERROR<cr>",
        desc = "Trouble: Errors",
      },
      {
        trouble_prefix .. "w",
        "<cmd>Trouble diagnostics toggle focus=false filter.severity=vim.diagnostic.severity.WARN<cr>",
        desc = "Trouble: Warnings",
      },
      {
        trouble_prefix .. "i",
        "<cmd>Trouble diagnostics toggle focus=false filter.severity=vim.diagnostic.severity.INFO<cr>",
        desc = "Trouble: Info",
      },
    },
  },
}
