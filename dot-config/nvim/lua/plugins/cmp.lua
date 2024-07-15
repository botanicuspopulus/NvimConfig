local luasnip = require("luasnip")
local cmp = require("cmp")

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'zbirenbaum/copilot-cmp',
    'max397574/cmp-greek',
    'chrisgrieser/cmp-nerdfont',
    'neovim/nvim-lspconfig',
    'onsails/lspkind-nvim',
    'paopaol/cmp-doxygen',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'tamago324/cmp-zsh',
    'andersevenrud/cmp-tmux',
    'kdheepak/cmp-latex-symbols',
    'nat-418/cmp-color-names.nvim',
    'amarakon/nvim-cmp-fonts',
    'roginfarrer/cmp-css-variables',
  },
  config = function(_, opts)


    cmp.setup({
      formatting = {
        exapandable_indicator = "󰘖",
        fields = { "kind", "abbr", "menu" },

        format = require("lspkind").cmp_format {
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
            nvim_lsp = "[LSP]",
            nvim_lsp_signature_help = "[Signature]",
            nvim_lua = "[Lua]",
            omni = "[Omni]",
            path = "[Path]",
            rg = "[Rg]",
            spell = "[Spell]",
            treesitter = "[Treesitter]",
          },
        },
      },

      autocomplete = false,

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      sources = cmp.config.sources(
        {
          { name = "copilot", priority = 1100, max_item_count = 3 },
          { name = 'nvim_lsp', priority = 1000 },
          { name = 'luasnip', priority = 750, max_item_count = 5 },
          {
            name = 'buffer', priority = 500,
            keyword_length = 5,
            max_itme_count = 10,
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
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
      ),

      sorting = {
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
      },

      duplicates = {
        npm = 1,
      },

      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },

      experimental = {
        ghost_text = true,
      },

      preselect = cmp.PreselectMode.None,

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping({
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
        }),
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.jump(1)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {"i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()

          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),

      completion = {
        autocomplete = false
      },

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
          { name = "copilot", priority = 90},
          { name = "nvim_lsp", priority = 100 },
          { name = "luasnip", priority = 80 },
          { name = "rg", priority = 70 },
          { name = "path", priority = 100 },
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
      autocomplete = false,
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
        { name = "buffer" }
      }),
    })

    cmp.setup.cmdline(":", {
      sources = cmp.config.sources(
        {
          { name = "path" },
        }, {
          { name = "cmdline", option = { ignore_cmds = { "Man", "!" }}},
        }, {
          { name = "cmdline_history" }
        }
      )

    })

    cmp.event:on(
      'confirm_done',
      require('nvim-autopairs.completion.cmp').on_confirm_done()
    )

    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false
    end)
  end,
}
