return {
    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██         ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                " ",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
            }
            return opts
        end,
    },
    -- You can disable default plugins as follows: { "max397574/better-escape.nvim", enabled = false },
    { "NMAC427/guess-indent.nvim", enabled = false },
    {
        "rcarriga/nvim-notify",
        opts = {
            top_down = false,
            timeout = 2000,
            hide_from_history = true,
            level = vim.log.levels.INFO,
            background = "NotifyBackground",
            render = 'wrapped-compact',
            animation = 'fade_in_slide_out',
        }
    },
}
