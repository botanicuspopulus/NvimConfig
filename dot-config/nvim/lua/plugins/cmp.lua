local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local function tab_complete(direction)
  local cmp = require "cmp"
  local luasnip = require "luasnip"

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

    if direction == 1 and vim.g.ai_accept and vim.g.ai_accept() then return end

    fallback()
  end
end

local common_sources = {
  { name = "copilot" },
  { name = "luasnip" },
  { name = "nvim_lsp" },
  { name = "nvim_lsp_signatute_help" },
  { name = "nvim_lua" },

  { name = "path" },
  { name = "buffer" },

  { name = "calc" },
  { name = "greek" },
  { name = "color_names" },
  { name = "nerdfont" },
  { name = "treesitter" },
  { name = "rg" },
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "dmitmel/cmp-cmdline-history",
    "hrsh7th/cmp-cmdline",

    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "zbirenbaum/copilot-cmp",

    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    "hrsh7th/cmp-calc",
    "max397574/cmp-greek",
    "chrisgrieser/cmp-nerdfont",
    "kdheepak/cmp-latex-symbols",
    "lukas-reineke/cmp-rg",
    "nat-418/cmp-color-names.nvim",
    "ray-x/cmp-treesitter",
    "onsails/lspkind-nvim",
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    opts.experimental = {
      ghost_text = {
        hl_group = "LspCodeLens",
      },
    }

    opts.formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        local lspkind = require "lspkind"
        vim_item = lspkind.cmp_format {
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        }(entry, vim_item)
        if entry.source.name == "copilot" then
          vim_item.kind = "󰚩"
          vim_item.kind_hl_group = "CmpItemKindCopilot"
        elseif entry.source.name == "luasnip" then
          vim_item.kind = ""
          vim_item.kind_hl_group = "CmpItemKindSnippet"
        elseif entry.source.name == "buffer" then
          vim_item.kind = ""
          vim_item.kind_hl_group = "CmpItemKindText"
        elseif entry.source.name == "path" then
          vim_item.kind = ""
          vim_item.kind_hl_group = "CmpItemKindFile"
        elseif entry.source.name == "nvim_lsp" then
          vim_item.kind = ""
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "nvim_lsp_signature_help" then
          vim_item.kind = "󰷻"
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "nvim_lua" then
          vim_item.kind = ""
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "calc" then
          vim_item.kind = ""
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "greek" then
          vim_item.kind = "󰘧"
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "nerdfont" then
          vim_item.kind = "󰛖"
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "color_names" then
          vim_item.kind = "󰏘"
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "latex_symbols" then
          vim_item.kind = "󰘧"
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "rg" then
          vim_item.kind = ""
          vim_item.kind_hl_group = "CmpItemKindFunction"
        elseif entry.source.name == "treesitter" then
          vim_item.kind = "󱁉"
          vim_item.kind_hl_group = "CmpItemKindFunction"
        end

        return vim_item
      end,
    }

    opts.completion = {
      completeopt = "menu,noinsert,popup,fuzzy",
    }

    opts.sources = common_sources

    opts.snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    }

    opts.confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }
    opts.preselect = cmp.PreselectMode.Item

    opts.mapping = cmp.mapping.preset.insert {
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
            cmp.confirm()
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm { select = true },
        c = cmp.mapping.confirm { select = true },
      },
      ["<C-CR>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
    }

    opts.window = {
      completion = cmp.config.window.bordered {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
      documentation = cmp.config.window.bordered {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    }

    opts.enabled = function()
      -- disable completion in comments
      local context = require "cmp.config.context"
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == "c" then
        return true
      else
        return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
      end
    end

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline_history" },
        { name = "cmdline" },
        { name = "path" },
        { name = "buffer" },
      },
    })

    cmp.setup.filetype("neo-tree-popup", {
      enabled = false,
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    return opts
  end,
}
