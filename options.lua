-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    autoindent=true,
    autoread = true,
    cindent = true,
    cmdheight=1,
    expandtab = true,
    joinspaces = false,
    list = true,
    listchars = { tab = "> ", trail = "·"},
    mouse = 'nv',
    number = true, -- sets vim.opt.number
    relativenumber = true, -- sets vim.opt.relativenumber
    shiftwidth= 2,
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    smartindent=true,
    softtabstop=2,
    spell = false, -- sets vim.opt.spell
    suffixes = "",
    tabstop=2,
    ttyfast = true,
    wildmode = 'longest:full,full',
    wrap = false, -- sets vim.opt.wrap
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
