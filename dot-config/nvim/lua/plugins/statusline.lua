local WrappingStatus = {
  provider = function()
    local mode = require("wrapping").get_current_mode()
    if mode == "" or not mode then return "" end
    return " WRAP: " .. string.upper(mode) .. " "
  end,
  update = { "OptionSet", pattern = "wrap", callback = vim.schedule_wrap(function() vim.cmd "redrawstatus" end) },
}

return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
      status.component.file_info {
        filename = false,
        filetype = false,
        file_modified = false,
      },
      status.component.git_branch(),
      status.component.git_diff(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.diagnostics(),
      status.component.lsp {
        lsp_client_names = false,
      },
      WrappingStatus,
      status.component.nav(),
    }
  end,
}
