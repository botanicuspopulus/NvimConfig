return {
    -- Add the community repository of plugin specifications
    "AstroNvim/astrocommunity",

    { import = "astrocommunity.bars-and-lines.vim-illuminate" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim", },
    { import = "astrocommunity.code-runner.overseer-nvim" },
    { import = "astrocommunity.code-runner.sniprun" },
    { import = "astrocommunity.code-runner.executor-nvim" },
    { import = "astrocommunity.code-runner.compiler-nvim" },
    { import = "astrocommunity.completion.cmp-cmdline" },
    { import = "astrocommunity.completion.copilot-lua-cmp" },
    { import = "astrocommunity.debugging.nvim-bqf" },
    { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
    { import = "astrocommunity.debugging.telescope-dap-nvim" },
    { import = "astrocommunity.diagnostics.trouble-nvim" },
    { import = "astrocommunity.diagnostics.lsp_lines-nvim"},
    { import = "astrocommunity.editing-support.chatgpt-nvim" },
    {
        "ChatGPT.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>a",
                mode = { "n", "v" },
                desc = " ChatGPT",
            },
            {
                "<leader>ae",
                "<cmd>ChatGPTEditWithInstructions<CR>",
                mode = { "v" },
                desc=" ChatGPT Edit with Instructions",
            },
            {
                "<leader>ac",
                "<CMD>ChatGPT<CR>",
                mode = { "n", "v" },
                desc="󰭹 ChatGPT",
            },
            {
                "<leader>ar",
                mode = { "v" },
                desc = "󰜎 ChatGPT Run",
            },
            {
                "<leader>ara",
                "<CMD>ChatGPTRun add_test<CR>",
                mode = { "v" },
                desc = "🧪 ChatGPTRun Add Test",
            },
            {
                "<leader>ard",
                "<CMD>ChatGPTRun docstring<CR>",
                mode = { "v" },
                desc = "󰈙 ChatGPTRun Docstring",
            },
            {
                "<leader>are",
                "<CMD>ChatGPTRun explain_code<CR>",
                mode = { "v" },
                desc = " ChatGPTRun Explain Code",
            },
            {
                "<leader>arc",
                "<CMD>ChatGPTRun complete_code<CR>",
                mode = { "v" },
                desc = "… ChatGPTRun Complete Code",
            },
            {
                "<leader>aro",
                "<CMD>ChatGPTRun optimize_code<CR>",
                mode = { "v" },
                desc = "󰇺 ChatGPTRun Optimize Code",
            },
            {
                "<leader>arf",
                "<CMD>ChatGPTRun fix_bugs<CR>",
                mode = { "v" },
                desc = "🔧 ChatGPTRun Fix Bugs",
            }
        }
    },
    { import = "astrocommunity.editing-support.dial-nvim" },
    { import = "astrocommunity.editing-support.hypersonic-nvim" },
    { import = "astrocommunity.editing-support.multicursors-nvim" },
    { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
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
    { import = "astrocommunity.editing-support.yanky-nvim" },
    { import = "astrocommunity.editing-support.treesj" },
    { import = "astrocommunity.git.diffview-nvim" },
    { import = "astrocommunity.git.git-blame-nvim" },
    { import = "astrocommunity.git.neogit" },
    { import = "astrocommunity.indent.indent-tools-nvim" },
    { import = "astrocommunity.lsp.inc-rename-nvim" },
    { import = "astrocommunity.markdown-and-latex.glow-nvim" },
    { import = "astrocommunity.markdown-and-latex.peek-nvim" },
    { import = "astrocommunity.motion.nvim-surround" },
    { import = "astrocommunity.motion.marks-nvim" },
    { import = "astrocommunity.pack.ansible" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.cmake" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.php" },
    { import = "astrocommunity.pack.ps1" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.svelte"},
    { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.pack.toml" },
    { import = "astrocommunity.pack.typescript-all-in-one" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.programming-language-support.csv-vim" },
    { import = "astrocommunity.programming-language-support.dooku-nvim" },
    { import = "astrocommunity.programming-language-support.nvim-jqx" },
    { import = "astrocommunity.programming-language-support.web-tools-nvim" },
    { import = "astrocommunity.project.nvim-spectre" },
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
    { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
    { import = "astrocommunity.utility.noice-nvim" },
    {
        "noice.nvim",
        popupmenu = {
            backend = "cmp",
        },
        lsp = {
            progess = {
                enabled = false
            }
        },
        messages = {
            view_search = false
        },
    },
    { import = "astrocommunity.utility.nvim-toggler" },
    {
        "nvim-toggler",
        keys = {
            {
                "<leader>i",
                mode = { "n", "v" },
                desc = "Toggler"
            }
        }
    }
}
