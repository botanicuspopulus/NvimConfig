return {
    'hrsh7th/nvim-cmp',
    keys = { ':', '/', '?' },
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'max397574/cmp-greek',
        'chrisgrieser/cmp-nerdfont',
        'neovim/nvim-lspconfig',
        'onsails/lspkind-nvim',
        'paopaol/cmp-doxygen',
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
    },
    config = function(_, opts)
        local cmp = require "cmp"

        opts.formatting.format = require("lspkind").cmp_format {
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "",
            symbol_map = {
                Codeium = "󰘦",
            },
        }

        opts.completion = {
            keyword_length = 1,
        }

        opts.sources = cmp.config.sources({
            { name = 'buffer' },
            { name = "nvim_lsp_document_symbol" },
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'path' },
            { name = 'greek' },
            { name = 'calc' },
            {
                name = "spell",
                option = {
                    keep_all_entries = false,
                    enable_in_context = function()
                        return true
                    end,
                }
            },
        },
        { name = "buffer"})

        opts.duplicates.npm = 1

        opts.experimental = {
            ghost_text = true,
        }

        opts.preselect = cmp.PreselectMode.None

        opts.mapping["<CR>"] = cmp.mapping.confirm({ select = true })

        opts.window = {
            completion = {
                col_offset = -3,
                side_padding = 0,
            },
        }

        -- run cmp setup
        cmp.setup(opts)

        cmp.setup.view = {
            entries = "native",
        }

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "cmp_git" },
                { name = "buffer" },
            }),
        })

        -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
        cmp.setup.cmdline("/", {
            enabled = function()
                -- Set of commands where cmp will be disabled
                local disabled = {
                    IncRename = true
                }
                -- Get first word of cmdline
                local cmd = vim.fn.getcmdline():match("%S+")
                -- Return true if cmd isn't disabled
                -- else call/return cmp.close(), which returns false
                return not disabled[cmd] or cmp.close()
            end,
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "nvim_lsp_document_symbol" },
                { name = "buffer" }
            }),
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            })
        })
    end,
}
