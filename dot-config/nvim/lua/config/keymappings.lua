local fd = vim.uv.fs_scandir(vim.fn.stdpath "config" .. "/lua/config/keymaps/")

if fd then
  for name in function() return vim.uv.fs_scandir_next(fd) end do
    require("config.keymaps." .. name:gsub(".lua$", ""))
  end
end
