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
      trigger = {
        show_on_blocked_trigger_characters = function(_)
          if vim.bo.filetype == "python" then return { ":" } end
          return { "\n", "\t", " " }
        end,
      },
      menu = {
        auto_show = function(ctx)
          if ctx.mode == "cmdline" then return false end
          return true
        end,
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
        auto_show_delay_ms = 1000,
        window = select_window,
      },
    }

    opts.signature = {
      window = window,
    }

    opts.sources = {
      min_keyword_length = function()
        if vim.bo.filetype == "markdown" then return 3 end
        return 2
      end,
      default = {
        "lsp",
        "buffer",
        "path",
        "ripgrep",
        "snippets",
        "nerdfont",
      },
      providers = {
        lsp = {
          name = "LSP",
          score_offset = 50,
        },
        path = {
          name = "Path",
          score_offset = 40,
          opts = {
            get_cwd = function(_) return vim.fn.getcwd() end,
          },
        },
        buffer = { name = "Buffer", score_offset = 30 },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          score_offset = 20,
          opts = {
            prefix_min_len = 3,
            context_size = 5,
            max_filesize = "1M",
            project_root_marker = ".git",
            search_casing = "--ignore-case",
            fallback_to_regex_highlighting = true,
          },
        },
        nerdfont = {
          module = "blink-nerdfont",
          name = "Nerd Font",
          score_offset = 15,
          opts = { insert = true },
          min_keyword_length = 3,
        },
        snippets = { name = "Snippets", score_offset = 5 },
      },
    }

    opts.appearance = {
      nerd_font_variant = "mono",
    }

    opts.fuzzy = {
      implementation = "rust",
      sorts = {
        "exact", -- 1. exact matches
        "score", -- 2. fuzzy match quality
        "sort_text", -- 3. LSP context hints
        "label", -- 4. alphabetical cleanup
        "kind", -- 5. semantic grouping
      },
    }
  end,
}
