return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = "make install_jsregexp",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load {
            paths = { vim.fn.stdpath "config" .. "/snippets" },
          }
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function(_, opts)
      local luasnip = require "luasnip"
      luasnip.setup(opts)

      -- Enable friendly-snippets' doc-comment snippets
      luasnip.filetype_extend("c", { "cdoc" })
      luasnip.filetype_extend("cpp", { "cppdoc" })
      luasnip.filetype_extend("python", { "pydoc" })
      luasnip.filetype_extend("lua", { "luadoc" })
      luasnip.filetype_extend("javascript", { "jsdoc" })
      luasnip.filetype_extend("typescript", { "tsdoc" })
    end,
  },
}
