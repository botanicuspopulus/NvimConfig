local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  'hrsh7th/nvim-cmp',
  keys = { ':', '/', '?' },
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'chrisgrieser/cmp-nerdfont',
    'kdheepak/cmp-latex-symbols',
    'lukas-reineke/cmp-rg',
    'max397574/cmp-greek',
    'mmolhoek/cmp-scss',
    'nat-418/cmp-color-names.nvim',
    'neovim/nvim-lspconfig',
    'onsails/lspkind-nvim',
    'paopaol/cmp-doxygen',
    'pontusk/cmp-sass-variables',
    'rafamadriz/friendly-snippets',
    'roginfarrer/cmp-css-variables',
    'saadparwaiz1/cmp_luasnip',
    'tamago324/cmp-zsh',
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    cmp.setup({
      ---@diagnostic disable: missing-fields
      formatting = {
        exapandable_indicator = "󰘖",
        fields = { "kind", "abbr", "menu" },

        format = require("lspkind").cmp_format {
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = '...',
          menu = {
            calc = "󰃬",
            cmdline = "",
            cmdline_history = " 󰋚",
            doxygen = "󰈙",
            luasnip = "[LuaSnip]",
            dictionary = "",
            nerdfont = "[NerdFont]",
            emoji = "󰱨",
            greek = "󱌮",
            latex_symbols = "[Latex]",
            nvim_lsp = "[LSP]",
            nvim_lsp_signature_help = "󰷻",
            nvim_lua = "[NeovimLua]",
            omni = "[Omni]",
            path = "󰴠",
            rg = "[Rg]",
            spell = "󰓆",
            treesitter = "",
          },
        },
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp', priority = 1000 },
          { name = 'nvim_lsp_signature_help', priority = 500 },
          { name = 'nvim_lsp_document_symbol', priority = 400 },
          { name = 'path', priority = 250 },
        },
        {
          { name = 'nvim_lua', priority = 130 },
        },
        {
          {name = "buffer", keyword_lenth = 3, priority = 130},
          { name = 'nerdfont', priority = 120 },
          { name = 'greek', priority = 110 },
          { name = 'calc', priority = 100 },
        }
      ),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      preselect = cmp.PreselectMode.None,

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-u>"] = cmp.mapping.select_prev_item({ count = 5 }),
        ["<C-d>"] = cmp.mapping.select_next_item({ count = 5 }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping(
          {
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                if luasnip.expandable() then
                  luasnip.expand()
                else
                  cmp.confirm({ behaviour = cmp.ConfirmBehavior.Replace, select = false })
                end
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behaviour = cmp.ConfirmBehavior.Replace, select = true }),
          }
        ),
        ["<C-c>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
      }),
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        })
      },

      enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")

        end
      end,
    })

    -- run cmp setup
    cmp.setup.filetype({"gitcommit", "markdown"}, {
      sources = cmp.config.sources(
        {
          { name = "git", priority = 110 },
        },
        {
          { name = "nvim_lsp", priority = 100 },
          { name = "path", priority = 100 },
          { name = "luasnip", priority = 80 },
          { name = "rg", priority = 70 },
          { name = "emoji", insert = true, priority = 60 },
        },
        {
          { name = "buffer", priority = 50 },
          { name = "spell", priority =  40 },
          { name = "calc", priority = 50 },
          { name = "treesitter", priority = 50 },
          { name = "dictionary", keyword_length = 2, priority = 10 },
        }),
    })


    -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
    cmp.setup.cmdline({"/", "?"}, {
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
        { name = "buffer" }
      }),
      mapping = cmp.mapping.preset.cmdline()
    })

    cmp.setup.cmdline(":", {
      sources = cmp.config.sources(
        { { name = "path" }, },
        { { name = "cmdline",  keyword_length = 3, option = { ignore_cmds = { "Man", "!", "w", "q" }}}, },
        { { name = "cmdline_history", keyword_length = 5 } }
      ),
      mapping = cmp.mapping.preset.cmdline()
    })
  end,
}
