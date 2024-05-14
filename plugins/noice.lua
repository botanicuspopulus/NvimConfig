return {
    {
        "folke/noice.nvim",
        lsp = {
            progess = {
                enabled = false,
            },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true,
            },
        },
        messages = {
            view_search = false
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    any = {
                        { find = '%d+L, %d+B' },
                        { find = '^%d+ changes?; after #%d+' },
                        { find = '^%d+ changes?; before #%d+' },
                        { find = '^Hunk %d+ of %d+$' },
                        { find = '^%d+ fewer lines;?' },
                        { find = '^%d+ more lines?;?' },
                        { find = '^%d+ line less;?' },
                        { find = '^Already at newest change' },
                        { kind = 'emsg', find = 'E486' },
                        { kind = 'quickfix' },
                    },
                },
                view = 'mini',
            },
            {
                filter = {
                    event = "msg_show",
                    any = {
                        { find = 'N^%d+ lines .ed %d+ times?$' },
                        { find = '^%d+ lines yanked$' },
                        { kind = 'emsg', find = 'E490' },
                        { kind = 'search_count' },
                    }
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = 'notify',
                    any = {
                        { find = '^No code action available$' },
                        { find = '^No information available$' },
                    },
                },
                view = 'mini',
            }
        },
        presets = {
            bottom_search = false,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
            inc_rename = false,
        },
        throttle = 1000 / 30,
    }
}
