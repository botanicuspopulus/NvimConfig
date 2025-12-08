for _, source in ipairs {
  "config.autocmds",
  "config.options",
  "config.keymappings",
} do
  local ok, fault = pcall(require, source)
  if not ok then vim.api.nvim_err_writeln("Failed to source " .. source .. "\n\n" .. fault) end
end

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local repo = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
    { import = "plugins.keymaps" },
  },
  install = { colorscheme = { "catppuccin-macchiato" } },
  performance = {
    rtp = {
      disable_plugins = {
        "2html_plugin",
        "bureport",
        "compiler",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "loaded_remote_plugins",
        "loaded_tutor_mode_plugin",
        "logipat",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
        "synmenu",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
	checker = { enabled = true },
})
