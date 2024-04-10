return {
  { 'famiu/bufdelete.nvim', enabled = false },
  {
    'mhinz/vim-sayonara',
    cmd = 'Sayonara',
    keys = {
      {
        '<leader>q',
        '<cmd>Sayonara<cr>',
        desc = 'Quit',
        mode = { 'n' },
      },
    },
  },
}

