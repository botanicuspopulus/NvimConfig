return {
    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "stable", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "nightly", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false, -- automatically quit the current session after a successful update
        remotes = { -- easily add new remotes to track
            --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
            --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
            --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        },
    },

    -- Set colorscheme to use
    colorscheme = "tokyonight-night",

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
        virtual_text = {
            --source = "always", -- Or "if_many"
            prefix = '●', -- Could be '■', '▎', 'x'
        },
        severity_sort = true,
        virtual_lines = {
            only_current_line = true,
        },
        float = {
            focusable = false,
            source = "always", -- Or "if_many"
            style = "minimal",
            border = "rounded",
            header = "",
            prefix = "",
        },
        update_in_insert = false,
        -- underline = true,
    },

    aerial = {
        autochdir = true
    },

    lsp = {
        -- customize lsp formatting options
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = false, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    "c",
                    "cpp",
                    "javascript",
                    "python",
                    "lua",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
                "lua_ls",
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
    },

    -- Configure require("lazy").setup() options
    lazy = {
        defaults = { lazy = true },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
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
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    -- Set up autocommands and custom highlight groups
    polish = function()
        -- Add additional commands for LaTeX and markdown files
        vim.api.nvim_create_augroup("bufcheck", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = "bufcheck",
            pattern = "tex",
            command = "nnoremap <leader>v <cmd>VimtexView<cr>",
        })
        vim.api.nvim_create_autocmd("FileType", {
            group = "bufcheck",
            pattern = "typst",
            command = "nnoremap <leader>v <cmd>sil !pdf %:r.pdf<cr>",
        })
        vim.api.nvim_create_autocmd("FileType", {
            group = "bufcheck",
            pattern = "markdown",
            command = "nnoremap <leader>v <cmd>MarkdownPreviewToggle<cr>",
        })

        -- Reset cursor after exiting
        vim.api.nvim_create_augroup("change_cursor", { clear = true })
        vim.api.nvim_create_autocmd("VimLeave", {
            group = "change_cursor",
            command = "set guicursor=a:ver90",
        })

        -- Set highlight groups for leap
        vim.api.nvim_set_hl(0, "LeapLabelPrimary", { link = "GruvboxOrangeBold" })
        vim.api.nvim_set_hl(0, "LeapLabelSecondary", { link = "GruvboxYellowBold" })

        -- Fix mappings to special characters by defining them again explicitly
        vim.keymap.set("n", "j", "/")
        vim.keymap.set("v", "j", "/")
        vim.keymap.set("n", "k", "'")
    end,
}
