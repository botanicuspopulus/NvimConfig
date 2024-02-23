return {
    { "bkad/CamelCaseMotion", lazy = false },
    { "wellle/targets.vim", lazy = false },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        opts = {
            search = {
                -- search/jump in all windows
                multi_window = false,
                -- search direction
                forward = true,
                wrap = true,

                mode = 'exact',
                -- acts like incsearch
                incremental = true,
                exclude = {
                    'notify',
                    'noice',
                    'cmp_menu',
                    function(win)
                        return not vim.api.nvim_win_get_config(win).focusable
                    end
                },
            },
            jump = {
                -- save location in jumplist
                jumplist = true,
                pos = 'start',
                -- add pattern to search history
                history = false,
                -- add pattern to search register
                register = false,
                -- clear highlighting after jump
                nohlsearch = true,
                -- automatically jump when there is only one match
                autojump = false
            },
            modes = {
                search = {
                    enabled = true,
                    highlight = { backdrop = false },
                    jump = { history = true, register = true, nohlsearch = true },
                    search = {},
                },
                char = {
                    enabled = false,
                    keys = { 'f', 'F', 't', 'T', ',' },
                    search = { wrap = false },
                    highlight = { backdrop = true },
                    jump = { register = false },
                },
            },
        },
        keys = {
            '/',
            {
                "s",
                mode = { "n" },
                function()
                    require("flash").jump {
                        search = {
                            mode = function(str) return '\\<' .. str end,
                        },
                    }
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function() require("flash").jump() end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc = "Treesitter Search",
            },
        },
    },
}
