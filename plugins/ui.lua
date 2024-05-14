---@diagnostic disable: mixed_table
return {
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            position = "bottom",
            height = 10,
            width = 50,
            icons = true,
            mode = "workspace_diagnostics",
            severity = nil,
            fold_open = "",
            fold_closed = "",
            group = true,
            padding = true,
            cycle_results = true,
            action_keys = {
                close = "q",
                cancel = "<esc>",
                refresh = "r",
                jump = {"<cr>", "<tab>"},
                open_split = { "<c-x>" },
                open_vsplit = { "<c-v>" },
                open_tab = { "<c-t>" },
                jump_close = {"o"},
                toggle_mode = "m",
                switch_severity = "s",
                toggle_preview = "P",
                hover = "K",
                preview = "p",
                close_folds = {"zM", "zm"},
                open_folds = {"zR", "zr"},
                toggle_fold = {"zA", "za"},
                previous = "k",
                next = "j",
                help = "?"
            },
            multiline = true,
            indent_lines = true,
            win_config = { border = "single" },
            auto_open = false,
            auto_close = false,
            auto_preview = true,
            auto_fold = false,
            auto_jump = { "lsp_definitions" },
            signs = {
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "",
            }
        },
        keys = {
            { "<leader>ut", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Toggle trouble" },
            { "<leader>fd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggle trouble for document" },
        },
    },
    {
        "anuvyklack/fold-preview.nvim",
        lazy = false,
        dependencies = "anuvyklack/keymap-amend.nvim",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            exclude = {
                filetypes = {
                    'checkhealth',
                    'git',
                    'gitcommit',
                    'lspinfo',
                    'man',
                    'mason',
                    'notify',
                },
            },
        },
    },
    {
        "anuvyklack/pretty-fold.nvim",
        lazy = false,
        opts = {},
    },
}
