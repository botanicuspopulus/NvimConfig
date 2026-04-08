local source_priority = {
  lsp = 1,
  snippets = 2,
  path = 3,
  buffer = 4,
  ripgrep = 5,
  datword = 6,
  nerdfont = 7,
}

return {
  {
    "saghen/blink.cmp",
    version = "*",
    build = "cargo build --release",
    opts_extend = {
      "sources.compat",
      "sources.default",
    },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      "xieyonn/blink-cmp-dat-word",
      "MahanRahmati/blink-nerdfont.nvim",
      { "mikavilpas/blink-ripgrep.nvim", version = "*" },
      "onsails/lspkind.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "saghen/blink.compat",
        optional = true,
        opts = {},
        version = "*",
      },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      snippets = { preset = "luasnip" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon

                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then icon = dev_icon end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local hl = ctx.kind_hl

                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then hl = dev_hl end
                  end

                  return hl
                end,
              },
            },
          },
          border = "single",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "single" },
        },
      },
      signature = {
        enabled = true,
        window = { border = "single" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          "score",
          "sort_text",
        },
      },
      sources = {
        compat = {},
        default = function()
          local ft = vim.bo.filetype
          if ft == "cpp" or ft == "c" or ft == "cuda" or ft == "cmake" or ft == "lua" or ft == "python" then
            return { "lsp", "snippets", "path", "buffer", "ripgrep" }
          end

          return { "lsp", "snippets", "path", "buffer", "ripgrep", "datword", "nerdfont" }
        end,
        min_keyword_length = function() return vim.bo.filetype == "markdown" and 2 or 0 end,
        providers = {
          lsp = {
            timeout_ms = 500,
            max_items = 10,
            async = true,
            score_offset = 10,
            transform_items = function(_, items)
              return vim.tbl_filter(function(item) return item.deprecated ~= true end, items)
            end,
          },
          buffer = {
            max_items = 10,
            opts = {
              max_total_buffer_size = 500000,
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr) return vim.bo[bufnr].buftype == "" end, vim.api.nvim_list_bufs())
              end,
            },
            score_offset = 4,
          },
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            ---@module "blink-ripgrep"
            ---@type blink-ripgrep.Options
            min_keyword_length = 4,
            opts = {
              backend = { use = "gitgrep-or-ripgrep" },
            },
            max_items = 10,
          },
          path = {
            max_items = 5,
            score_offset = 6,
          },
          snippets = {
            max_items = 8,
            should_show_items = function(ctx) return ctx.trigger.initial_kind ~= "trigger_character" end,
            score_offset = 8,
          },
          datword = {
            name = "Word",
            module = "blink-cmp-dat-word",
            opts = {
              paths = {
                vim.fn.stdpath "config" .. "/spell/words_alpha.txt",
              },
            },
            score_offset = 0,
          },
          nerdfont = {
            module = "blink-nerdfont",
            name = "Nerd Fonts",
            opts = { insert = true },
            score_offset = -5,
          },
        },
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = "cmdline",
          ["<Tab>"] = false,
          ["<S-Tab>"] = false,
        },
        completion = {
          list = { selection = { preselect = false } },
          menu = {
            auto_show = function(ctx) return vim.fn.getcmdtype() == ":" end,
          },
          ghost_text = { enabled = true },
        },
      },

      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
    },
    config = function(_, opts)
      local enabled = opts.sources.default

      for _, source in ipairs(opts.sources.compat or {}) do
        opts.sources.providers[source] = vim.tbl_deep_extend(
          "force",
          { name = source, module = "blink.compat.source" },
          opts.sources.providers[source] or {}
        )

        if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then table.insert(enabled, source) end
      end

      opts.sources.compat = nil

      require("blink.cmp").setup(opts)
    end,
  },
}
