return {
  "kevinhwang91/nvim-hlslens",
  event = "BufRead",
  config = function()
    require("hlslens").setup()

    local kopts = { noremap = true, silent = true }

    local keymap_n = function(key, action)
      vim.keymap.set(
        'n',
        key,
        action .. [[ <cmd>lua require('hlslens').start()<cr> ]],
        kopts
      )
    end

    local keymap = {
      ['n'] = "<cmd>execute('normal! " .. vim.v.count1 .. "n')<cr>",
      ['N'] = "<cmd>execute('normal! " .. vim.v.count1 .. "N')<cr>",
      ['*'] = '*',
      ['#'] = '#',
      ['g*'] = 'g*',
      ['g#'] = 'g#',
      ['<leader>cl'] = '<cmd>noh<cr>'
    }

    for key, action in pairs(keymap) do
      keymap_n(key, action)
    end
  end,
}
