require("lazy").setup({
    {
        "AstroNvim/AstroNvim",
        version = "^5", -- Remove version tracking to elect for nightly AstroNvim
        import = "astronvim.plugins",
        opts = { -- AstroNvim options must be set here with the `import` key
            mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
            maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
            icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
            pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
        },
    },
    { import = "community" },
    { import = "plugins" },
} --[[@as LazySpec]], {
        -- Configure any other `lazy.nvim` configuration options here
        install = { colorscheme = { "tokyonight", "astrodark", "habamax" } },
        ui = { backdrop = 100 },
        performance = {
            rtp = {
                -- disable some rtp plugins, add more to your liking
                disabled_plugins = {
                    "2html_plugin",
                    "getscript",
                    "getscriptPlugin",
                    "logipat",
                    "netrw",
                    "netrwFileHandlers",
                    "loaded_remote_plugins",
                    "loaded_tutor_mode_plugin",
                    "netrwSettings",
                    "rrhelper",
                    "spellfile_plugin",
                    "tohtml",
                    "gzip",
                    "matchit",
                    "tutor",
                    "zipPlugin",
                    "netrwPlugin",
                    "tar",
                    "tarPlugin",
                    "matchparen"
                },
            },
        },
    } --[[@as LazyConfig]])
