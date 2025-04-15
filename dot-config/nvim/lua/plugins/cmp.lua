local cmp = require "cmp"
local luasnip = require "luasnip"

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local function tab_complete(direction)
  return function(fallback)
    if cmp.visible() and #cmp.get_entries() == 1 then
      cmp.confirm { select = true }
      return
    end

    if cmp.visible() then
      if direction > 0 then
        cmp.select_next_item()
      else
        cmp.select_prev_item()
      end
      return
    end

    if has_words_before() then
      cmp.complete()
      if #cmp.get_entries() == 1 then cmp.confirm { select = true } end
      return
    end

    if luasnip.locally_jumpable(direction) then
      luasnip.jump(direction)
      return
    end

    if direction == 1 and vim.g.ai_accept() and vim.g.ai_accept() then return end

    fallback()
  end
end

local common_sources = {
  { name = "copilot", group_index = 1 },
  { name = "luasnip", group_index = 1 },
  { name = "nvim_lsp", group_index = 1 },
  { name = "nvim_lua", group_index = 1 },

  { name = "path", group_index = 2 },
  { name = "buffer", group_index = 2 },

  { name = "calc", group_index = 3 },
  { name = "latex_symbols", group_index = 3 },
  { name = "greek", group_index = 3 },
  { name = "color_names", group_index = 3 },
  { name = "nerdfont", group_index = 3 },
  { name = "treesitter", group_index = 3 },
  { name = "rg", group_index = 3 },
}

return {
  "hrsh7th/nvim-cmp",
  keys = { ":", "/", "?" },
  dependencies = {
    "chrisgrieser/cmp-nerdfont",
    "dmitmel/cmp-cmdline-history",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "kdheepak/cmp-latex-symbols",
    "lukas-reineke/cmp-rg",
    "max397574/cmp-greek",
    "nat-418/cmp-color-names.nvim",
    "neovim/nvim-lspconfig",
    "onsails/lspkind-nvim",
    "rafamadriz/friendly-snippets",
    "ray-x/cmp-treesitter",
    "saadparwaiz1/cmp_luasnip",
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    cmp.setup {
      ---@diagnostic disable: missing-fields
      formatting = {
        exapandable_indicator = "󰘖",
        fields = { "kind", "abbr", "menu" },

        format = require("lspkind").cmp_format {
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            buffer = "",
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

      completion = {
        completeopt = "menu,menuone,noinsert",
        autocomplete = false,
      },

      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },

      sources = cmp.config.sources(common_sources),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      preselect = cmp.PreselectMode.None,

      mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping(tab_complete(1), { "i", "c" }),
        ["<Tab>"] = cmp.mapping(tab_complete(1), { "i", "c" }),
        ["<C-p>"] = cmp.mapping(tab_complete(-1), { "i", "c" }),
        ["<S-Tab>"] = cmp.mapping(tab_complete(-1), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-u>"] = cmp.mapping.select_prev_item { count = 5 },
        ["<C-d>"] = cmp.mapping.select_next_item { count = 5 },
        ["<C-c>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping {
          i = function(fallback)
            if cmp.visible() then
              cmp.confirm { behaviour = cmp.ConfirmBehavior.Replace, select = true }
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm { select = true },
          c = cmp.mapping.confirm { behaviour = cmp.ConfirmBehavior.Replace, select = true },
        },
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
      },
      window = {
        completion = cmp.config.window.bordered {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
        documentation = cmp.config.window.bordered {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },

      enabled = function()
        -- disable completion in comments
        local context = require "cmp.config.context"
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
        end
      end,
    }

    -- run cmp setup
    cmp.setup.filetype({ "gitcommit", "markdown" }, {
      sources = {
        { name = "git" },
        { name = "spell" },
        { name = "dictionary" },
      },
    })

    -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
    cmp.setup.cmdline({ "/", "?" }, {
      sources = { { name = "buffer" } },
    })
  end,
}
