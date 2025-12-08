-- Interface
vim.opt.termguicolors = true
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 4
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.ruler = false
vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.winminwidth = 5
vim.opt.confirm = true
vim.opt.lazyredraw = true
vim.opt.conceallevel = 2
vim.opt.signcolumn = 'yes'
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.cmdheight = 0

-- Performance
vim.opt.history = 100
vim.opt.redrawtime = 1500
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 100

-- Splitting
vim.opt.splitkeep = 'screen'
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.backspace = { 'eol', 'start', 'indent' }
vim.opt.fileencoding = 'utf-8'

-- Core indentation options
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true

-- Line Folding
vim.opt.fillchars = {
  foldopen = ' ',
  foldclose = '>',
  fold = ' ',
  foldsep = ' ',
  diff = '/',
  eob = ' ',
}

vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldtext = ''

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- Formatting
vim.opt.formatoptions = 'jcrnoqlnt'

-- Completion
vim.opt.completeopt = { 'menu','menuone','noselect' }
vim.opt.shortmess = vim.opt.shortmess + {
  c = true
} -- Hide all the completion messages

-- Search
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wildmenu = true
vim.opt.wildignore = vim.opt.wildignore + { '*/node_modules/*', '*/.git/*', '*/__pycache__/*', '*/build/*' }

-- Line numbers
vim.opt.number = true

