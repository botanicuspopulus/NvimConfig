local fd = vim.uv.fs_scandir(vim.fn.stdpath "config" .. "/lua/config/keymaps/")

if fd then
  for name in function() return vim.uv.fs_scandir_next(fd) end do
    local source = "config.keymaps." .. name:gsub(".lua$", "")
    local ok, keymaps = pcall(require, source)

    if ok then
      for _, keymap in ipairs(keymaps) do
        vim.keymap.set(unpack(keymap))
      end
    else
      vim.notify("Failed to load " .. source .. "\n\n" .. keymaps, vim.log.levels.ERROR)
    end
  end
end

pcall(vim.keymap.del, { "i", "s" }, "<Tab>")
pcall(vim.keymap.del, { "i", "s" }, "<S-Tab>")
