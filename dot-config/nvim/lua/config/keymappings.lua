local fd = vim.loop.fs_scandir(vim.fn.stdpath "config" .. "/lua/config/keymaps/")

for name in function() return vim.loop.fs_scandir_next(fd) end do
  require('config.keymaps.' .. name:gsub('.lua$', ''))
end
