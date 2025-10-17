return {
  {
    "folke/trouble.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
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
