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
    'max397574/cmp-greek',
    'neovim/nvim-lspconfig',
    'onsails/lspkind-nvim',
    'paopaol/cmp-doxygen',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'tamago324/cmp-zsh',
    'nat-418/cmp-color-names.nvim',
    'amarakon/nvim-cmp-fonts',
    'roginfarrer/cmp-css-variables',
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
          menu = {
            buffer = "[Buffer]",
            calc = "[Calc]",
            cmdline = "[Cmdline]",
            cmdline_history = "[History]",
            doxygen = "[Doxygen]",
            luasnip = "[LuaSnip]",
            cmp_tabnine = "[TabNine]",
            copilot = "[Copilot]",
            dictionary = "[Dictionary]",
            nerdfont = "[NerdFont]",
            emoji = "[Emoji]",
            greek = "[Greek]",
            latex_symbols = "[Latex]",
            nvim_lsp = "[LSP]",
            nvim_lsp_signature_help = "[Signature]",
            nvim_lua = "[NeovimLua]",
            omni = "[Omni]",
            path = "[Path]",
            rg = "[Rg]",
            spell = "[Spell]",
            treesitter = "[Treesitter]",
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
          { name = "copilot", priority = 1100, max_item_count = 3 },
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
      experimental = {
        ghost_text = true,
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
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behaviour = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
              luasnip.jump(1)
            else
              fallback()
            end
          end, {"i", "s" }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.jump(-1)
            end
          end, { "i", "s" }
        ),
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
          { name = "copilot", priority = 110},
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
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
        { name = "buffer" }
      }),
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace ,select = false }),
      }),
    })

    cmp.setup.cmdline(":", {
      sources = cmp.config.sources(
        { { name = "path" }, },
        { { name = "cmdline",  keyword_length = 3, option = { ignore_cmds = { "Man", "!", "w", "q" }}}, },
        { { name = "cmdline_history", keyword_length = 5 } }
      ),
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace ,select = false }),
      }),
    })
  end,
}
