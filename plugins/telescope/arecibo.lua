return {
  {
    'nvim-telescope/telescope-arecibo.nvim',
    rocks = { 'openssl', 'lua-http-parser' },
    config = function()
      require('telescope').load_extension('arecibo')
    end,
  },
}
