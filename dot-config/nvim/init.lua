--
vim.opt.termguicolors = true

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core indentation options
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Line numbers
vim.opt.number = true

local grp = vim.api.nvim_create_augroup("number_toggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  group = grp,
  callback = function() vim.wo.relativenumber = true end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
  group = grp,
  callback = function() vim.wo.relativenumber = false end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "catppuccin-macchiato" } },
  performance = {
    rtp = {
      disable_plugins = {
        '2html_plugin',
        'getscript',
        'getscriptPlugin',
        'logipat',
        'netrw',
        'netrwFileHandlers',
        'loaded_remote_plugins',
        'loaded_tutor_mode_plugin',
        'netrwSettings',
        'rrhelper',
        'spellfile_plugin',
        'tohtml',
        'gzip',
        'matchit',
        'tutor',
        'zipPlugin',
        'netrwPlugin',
        'tar',
        'tarPlugin',
        'matchparen',
      },
    },
  },
	checker = { enabled = true },
})
