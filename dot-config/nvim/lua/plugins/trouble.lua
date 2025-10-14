return {
  {
    "folke/trouble.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = "Trouble: Diagnostics" },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Trouble: Buffer Diagnostics (Trouble)'},
      { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Trouble: Symbols' },
      { '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'Trouble: LSP Definitions/References' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Trouble: Location List' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Trouble: Quickfix List' },
      { '<leader>xe', '<cmd>Trouble diagnostics toggle focus=false filter.severity=vim.diagnostic.severity.ERROR<cr>', desc = 'Trouble: Errors' },
      { '<leader>xw', '<cmd>Trouble diagnostics toggle focus=false filter.severity=vim.diagnostic.severity.WARN<cr>', desc = 'Trouble: Warnings'},
      { '<leader>xi', '<cmd>Trouble diagnostics toggle focus=false filter.severity=vim.diagnostic.severity.INFO<cr>', desc = 'Trouble: Info' },
    },
    opts = {
      focus = false,
      follow = true,
      indent_guides = true,
      multiline = true,
      win = {},
      preview = { type = 'main', scratch = true },
    },
  },
}
