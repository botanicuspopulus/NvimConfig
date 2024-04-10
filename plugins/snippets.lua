return {
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function(plugin, opts)
            local ls = require 'luasnip'
            require('astronvim.plugins.configs.luasnip')(plugin, opts)
            require('luasnip/loaders/from_vscode').lazy_load( { paths = { './lua/user/snippets' } } )
            ls.config.set_config {
                -- This tells LuaSnip to remember to keep around the last snippet.
                -- You can jump back into it even if you move outside of the selection
                history = true,

                -- This one is cool since if you have dynamic snippets, it updates as you type!
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = false
            }
            ls.filetype_extend("javascriptreact", { "javascript" })
            ls.filetype_extend("typescript", {"javascript"})
            ls.filetype_extend("typescriptreact", {"javascript"})
        end,
    }
}
