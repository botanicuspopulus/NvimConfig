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
        'zbirenbaum/copilot-cmp',
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
            menu = {
                buffer = "[Buffer]",
                calc = "[Calc]",
                cmdline = "[Cmdline]",
                cmdline_history = "[History]",
                cmp_doxygen = "[Doxygen]",
                cmp_luasnip = "[LuaSnip]",
                cmp_tabnine = "[TabNine]",
                copilot = "[Copilot]",
                dictionary = "[Dictionary]",
                emoji = "[Emoji]",
                greek = "[Greek]",
                latex_symbols = "[Latex]",
                luasnip = "[LuaSnip]",
                nvim_lsp_document_symbol = "[Document]",
                nvim_lsp = "[LSP]",
                nvim_lsp_signature_help = "[Signature]",
                nvim_lua = "[Lua]",
                omni = "[Omni]",
                path = "[Path]",
                rg = "[Rg]",
                spell = "[Spell]",
                treesitter = "[Treesitter]",
            },
        }
        opts.completion = {
            keyword_length = 1,
        }

        opts.sources = cmp.config.sources(
            {
                { name = 'nvim_lsp', priority = 1000 },
                { name = 'luasnip', priority = 750, max_item_count = 5 },
                { name = 'buffer', priority = 500, keyword_length = 5, max_itme_count = 10, option = {
                    get_bufnrs = function()
                        local bufs = {}
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            bufs[vim.api.nvim_win_get_buf(win)] = true
                        end
                        return vim.tbl_keys(bufs)
                    end,
                },
                },
                { name = 'path', priority = 250 },
                { name = 'nvim_lsp_document_symbol', priority = 150 },
                { name = 'nvim_lsp_signature_help', priority = 140 },
                { name = 'nvim_lua', priority = 130 },
                { name = 'calc', priority = 120 },
                { name = 'greek', priority = 110 },
            },
            {
                name = "spell",
                option = {
                    keep_all_entries = false,
                    enable_in_context = function()
                        return true
                    end,
                }
            },
            { name = "buffer"}
        )

        opts.sorting = {
            priority_weight = 2,
            comparators = {
                function(entry1, entry2)
                    local types = require "cmp.types"
                    if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
                        return false
                    end
                    if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
                        return true
                    end
                end,
                require("copilot_cmp.comparators").prioritize or function() end,
                cmp.config.compare.exact,
                cmp.config.compare.locality,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                cmp.config.offset,
                cmp.config.sort_text,
                cmp.config.order
            },
        }
        opts.duplicates = {
            npm = 1,
        }
        opts.confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }
        opts.experimental = {
            ghost_text = true,
        }
        opts.preselect = cmp.PreselectMode.None

        opts.mapping["<CR>"] = cmp.mapping.confirm({ select = true })

        opts.window = {
            completion = cmp.config.window.bordered({
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            }),
            documentation = cmp.config.window.bordered({
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            })
        }

        -- run cmp setup
        cmp.setup(opts)

        cmp.setup.view = {
            entries = "native",
        }

        cmp.setup.filetype({"gitcommit", "markdown"}, {
            sources = cmp.config.sources({
                { name = "copilot", priority = 90},
                { name = "nvim_lsp", priority = 100 },
                { name = "luasnip", priority = 80 },
                { name = "rg", priority = 70 },
                { name = "path", priority = 100 },
                { name = "emoji", insert = true, priority = 60 },
            }, {
                    { name = "buffer", priority = 50 },
                    { name = "spell", priority =  40 },
                    { name = "calc", priority = 50 },
                    { name = "treesitter", priority = 50 },
                    { name = "dictionary", keyword_length = 2, priority = 10 },
                }),
        })

        -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
        cmp.setup.cmdline("/", {
            enabled = function()
                -- Set of commands where cmp will be disabled
                local disabled = { IncRename = true }
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
                { name = "cmdline", option = { ignore_cmds = { "Man", "!" }}},
                { name = "cmdline_history" }
            })
        })
    end,
}
