local fd = vim.uv.fs_scandir(vim.fn.stdpath "config" .. "/lua/config/keymaps/")

if fd then
  for name in function() return vim.uv.fs_scandir_next(fd) end do
    local source = "config.keymaps." .. name:gsub(".lua$", "")
    local keymaps = require(source)

    for _, keymap in ipairs(keymaps) do
      vim.keymap.set(unpack(keymap)) 
    end

  end
end
