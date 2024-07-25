return {
    -- Add the community repository of plugin specifications
    "AstroNvim/astrocommunity",

    { import = "astrocommunity.bars-and-lines.vim-illuminate" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim", },
    { import = "astrocommunity.colorscheme.tokyodark-nvim", },
    { import = "astrocommunity.code-runner.overseer-nvim" },
    { import = "astrocommunity.code-runner.sniprun" },
    { import = "astrocommunity.code-runner.executor-nvim" },
    { import = "astrocommunity.code-runner.compiler-nvim" },
    { import = "astrocommunity.code-runner.toggletasks-nvim" },
    { import = "astrocommunity.completion.cmp-cmdline" },
    { import = "astrocommunity.completion.cmp-latex-symbols" },
    { import = "astrocommunity.completion.cmp-calc" },
    { import = "astrocommunity.completion.cmp-nerdfont" },
    { import = "astrocommunity.completion.cmp-nvim-lua" },
    { import = "astrocommunity.completion.cmp-under-comparator" },
    { import = "astrocommunity.completion.copilot-lua-cmp" },
    { import = "astrocommunity.debugging.nvim-bqf" },
    { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
    { import = "astrocommunity.debugging.telescope-dap-nvim" },
    { import = "astrocommunity.diagnostics.trouble-nvim" },
    { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
    { import = "astrocommunity.editing-support.dial-nvim" },
    { import = "astrocommunity.editing-support.hypersonic-nvim" },
    { import = "astrocommunity.editing-support.multicursors-nvim" },
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
            }
        }
    },
    { import = "astrocommunity.editing-support.telescope-undo-nvim" },
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    { import = "astrocommunity.editing-support.treesj" },
    { import = "astrocommunity.editing-support.yanky-nvim" },
    { import = "astrocommunity.editing-support.nvim-regexplainer" },
    { import = "astrocommunity.file-explorer.oil-nvim" },
    { import = "astrocommunity.git.diffview-nvim" },
    { import = "astrocommunity.git.git-blame-nvim" },
    { import = "astrocommunity.icon.mini-icons" },
    { import = "astrocommunity.indent.indent-tools-nvim" },
    { import = "astrocommunity.indent.indent-blankline-nvim" },
    { import = "astrocommunity.lsp.inc-rename-nvim" },
    { import = "astrocommunity.lsp.actions-preview-nvim" },
    { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
    { import = "astrocommunity.markdown-and-latex.glow-nvim" },
    { import = "astrocommunity.markdown-and-latex.peek-nvim" },
    { import = "astrocommunity.motion.nvim-surround" },
    { import = "astrocommunity.motion.flit-nvim" },
    { import = "astrocommunity.motion.marks-nvim" },
    { import = "astrocommunity.neovim-lua-development.lazydev-nvim" },
    { import = "astrocommunity.pack.ansible" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.cmake" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.godot" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.php" },
    { import = "astrocommunity.pack.ps1" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.python-ruff" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.svelte"},
    { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.pack.toml" },
    { import = "astrocommunity.pack.typescript-all-in-one" },
    { import = "astrocommunity.pack.verilog" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.programming-language-support.csv-vim" },
    { import = "astrocommunity.programming-language-support.dooku-nvim" },
    { import = "astrocommunity.programming-language-support.nvim-jqx" },
    { import = "astrocommunity.programming-language-support.web-tools-nvim" },
    { import = "astrocommunity.search.nvim-spectre" },
    { import = "astrocommunity.register.nvim-neoclip-lua" },
    { import = "astrocommunity.syntax.hlargs-nvim" },
    { import = "astrocommunity.syntax.vim-cool" },
    { import = "astrocommunity.syntax.vim-easy-align" },
    { import = "astrocommunity.search.nvim-hlslens" },
    { import = "astrocommunity.search.sad-nvim" },
    { import = "astrocommunity.split-and-window.windows-nvim" },
    {
        "windows.nvim",
        keys = {
            {
                "<C-w>z",
                "<cmd>WindowsMaximize<CR>",
                desc="Maximize",
            },
            {
                "<C-w>_",
                "<cmd>WindowsMaximizeVertically<CR>",
                desc="Maximize vertically",
            },
            {
                "<C-w>|",
                "<cmd>WindowsMaximizeHorizontally<CR>",
                desc="Maximize horizontally",
            },
            {
                "<C-w>=",
                "<cmd>WindowsEqualize<CR>",
                desc="Equalize",
            }
        }
    },
    { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
    { import = "astrocommunity.terminal-integration.vim-tpipeline" },
    { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
    { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
    { import = "astrocommunity.utility.noice-nvim" },
    { import = "astrocommunity.utility.nvim-toggler" },
    { import = "astrocommunity.utility.telescope-lazy-nvim" },
}
