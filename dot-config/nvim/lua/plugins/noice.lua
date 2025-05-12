return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  opts = {
    views = {
      cmdline_popup = {
        position = { row = 5, col = "50%" },
        size = { width = 60, height = "auto" },
      },
      popupmenu = {
        relative = "editor",
        position = { row = 8, col = "50%" },
        size = { width = 60, height = 10 },
        border = { style = "none", padding = { 0, 1 } },
        win_options = { winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" } },
      },
      split = {
        enter = true,
        size = "50%",
        win_options = { scrolloff = 6 },
        close = { keys = { "q" } },
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          cond = function(message)
            local title = message.opts and message.opts.title or ""
            return title == "mason"
          end,
        },
        view = "mini",
      },
      {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            local client = vim.tbl_get(message.opts, "progess", "client")
            return client == "lua_ls"
          end,
        },
        opts = { skip = true },
      },
    },
    lsp = {
      progress = { enabled = false },
      hover = { enabled = true },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    messages = { view_search = false },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
  },
}
