---@module "lazy"
---@type LazySpec
return {
  "Saghen/blink.cmp",
  build = "cargo build --release",
  dependencies = {
    "MahanRahmati/blink-nerdfont.nvim",
    "mikavilpas/blink-ripgrep.nvim",
    "folke/snacks.nvim",
  },
  opts = function(_, opts)
    if not opts.keymap then opts.keymap = {} end

    opts.keymap["<Tab>"] = {
      "snippet_forward",
      function()
        if vim.g.ai_accept then return vim.g.ai_accept() end
      end,
      "fallback",
    }
    opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }

    local border = "rounded"

    local window = {
      border = border,
    }

    local select_window = {
      border = border,
    }

    opts.completion = {
      menu = {
        auto_show = function(ctx) return ctx.mode ~= "cmdline" end,
        border = border,
        draw = {
          padding = { 1, 1 },
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            source_name = {
              text = function(ctx)
                local source_name = "[ " .. ctx.source_name .. " ]"
                return source_name
              end,
            },
            kind = {
              text = function(ctx)
                local kind = "<" .. ctx.kind .. ">"
                return kind
              end,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
          },
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = select_window,
      },
    }

    opts.signature = {
      window = window,
    }

    opts.sources = {
      min_keyword_length = function()
        if vim.bo.filetype == "markdown" then return 2 end
        return 0
      end,
      default = {
        "lsp",
        "snippets",
        "buffer",
        "path",
        "ripgrep",
        "nerdfont",
      },
      providers = {
        nerdfont = {
          module = "blink-nerdfont",
          name = "Nerd Fonts",
          score_offset = 15,
          opts = { insert = true },
        },
        path = {
          opts = {
            get_cwd = function(_) return vim.fn.getcwd() end,
          },
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          opts = {
            prefix_min_len = 3,
            context_size = 5,
            max_filesize = "1M",
            project_root_marker = ".git",
            search_casing = "--ignore-case",
            fallback_to_regex_highlighting = true,
          },
        },
      },
    }

    opts.appearance = {
      nerd_font_variant = "mono",
    }

    opts.fuzzy = {
      implementation = "rust",
      sorts = {
        "exact",
        "score",
        "sort_text",
      },
    }
  end,
}
