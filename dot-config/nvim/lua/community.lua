return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.code-runner.compiler-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.code-runner.sniprun" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.hypersonic-nvim" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  {
    "refactoring.nvim",
    keys = {
      {
        "<leader>r",
        mode = { "n", "v" },
        desc = "襁Refactoring",
      },
    },
  },
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.remote-development.remote-sshfs-nvim" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.syntax.vim-cool" },
  { import = "astrocommunity.syntax.vim-easy-align" },
  { import = "astrocommunity.search.nvim-hlslens" },
  { import = "astrocommunity.split-and-window.windows-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  { import = "astrocommunity.terminal-integration.vim-tpipeline" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  { import = "astrocommunity.utility.mason-tool-installer-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
}
