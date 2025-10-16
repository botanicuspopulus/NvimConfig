local map = vim.keymap.set

map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit'})

map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

map({ 'n' }, "<C-h>", "<C-w>h", { desc = "Window: Go Left", remap = true })
map({ 'n' }, "<C-j>", "<C-w>j", { desc = "Window: Go Down", remap = true })
map({ 'n' }, "<C-k>", "<C-w>k", { desc = "Window: Go Up", remap = true })
map({ 'n' }, "<C-l>", "<C-w>l", { desc = "Window: Go Right", remap = true })

map('n', '<leader>bb', '<cmd>e #<cr>', { desc = "Buffer: Switch to other" })
map('n', '<leader>bo', function()
  Snacks.bufdelete.other()
end, { desc = "Buffer: Delete Other" })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = "Buffer: Delete Buffer and Window" })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- windows
map('n', '<leader>-', '<C-W>s', { desc = 'Window: Split Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Window: Split Right', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = "Window: Delete", remap = true })

map('n', '<leader><tab>l', "<cmd>tablast<cr>", { desc = 'Tab: Last' })
map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Tab: Close Other' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'Tab: First' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'Tab: New' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Tab: Next' })
map('n', '<leader><tab>[', '<cmd>tabprev<cr>', { desc = 'Tab: Previous' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Tab: Close' })

