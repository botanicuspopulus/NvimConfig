return {
  "folke/noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
      split = {
        enter = true,
        size = "50%",
        win_options = { scrolloff = 6 },
        close = { keys = { "q" } },
      },
    },
    lsp = {
      progess = {
        enabled = false,
      },
      hover = {
        enabled = true,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    messages = {
      view_search = false,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "^%d+ changes?; after #%d+" },
            { find = "^%d+ changes?; before #%d+" },
            { find = "^Hunk %d+ of %d+$" },
            { find = "^%d+ fewer lines;?" },
            { find = "^%d+ more lines?;?" },
            { find = "^%d+ line less;?" },
            { find = "^Already at newest change" },
            { kind = "emsg", find = "E486" },
            { kind = "quickfix" },
          },
        },
        view = "mini",
      },
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            local client = vim.tbl_get(message.opts, "progress", "client")
            return client == "lua_ls"
          end,
        },
        opts = { skup = true },
      },
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "N^%d+ lines .ed %d+ times?$" },
            { find = "^%d+ lines yanked$" },
            { kind = "emsg", find = "E490" },
            { kind = "search_count" },
            { kind = "", find = "written$" },
          },
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          any = {
            { find = "^No code action available$" },
            { find = "^No information available$" },
          },
        },
        view = "mini",
      },
      {
        filter = {
          event = "notify",
          cond = function(message)
            local title = message.opts and message.opts.title or ""
            return vim.tbl_contains({ "mason" }, title)
          end,
        },
        view = "mini",
      },
      {
        filter = {
          min_height = 10,
          ["not"] = {
            event = "lsp",
          },
          kind = { "error" },
        },
        view = "split",
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
      inc_rename = true,
    },
    throttle = 1000 / 30,
  },
}
