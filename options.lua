return {
    opt = {
        autoread = true,
        autoindent=true,
        cindent = true,
        smartindent = true,
        expandtab = true,
        smarttab = true,
        confirm = false,
        cmdheight = 1,
        joinspaces = false,
        conceallevel = 3,
        lazyredraw = false,
        ttyfast = true,
        list = true,
        listchars = {
            tab = "» ",
            trail = "·",
            nbsp = "␣",
            eol = "↲",
            extends = "⟩",
            precedes = "⟨",
        },
        matchtime = 2,
        mouse = 'nv',
        number = true,
        relativenumber = true,
        signcolumn = "auto",
        inccommand = "nosplit",
        autochdir = true,
        showtabline = 0,
        shiftwidth = 4,
        softtabstop = 4,
        tabstop = 4,
        spell = false,
        suffixes = "",
        wildmode = 'longest:full,full',
        wrap = false,
        clipboard = 'unnamed,unnamedplus',
    },
    g = {
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
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
