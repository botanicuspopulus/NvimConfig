vim.api.nvim_create_augroup("DapGroup", { clear = true })

local function navigate(args)
  local buffer = args.buf

  local wid = nil
  local win_ids = vim.api.nvim_list_wins()

  for _, win_id in ipairs(win_ids) do
    local win_bufnr = vim.api.nvim_win_get_buf(win_id)

    if win_bufnr == buffer then wid = win_id end

    if wid == nil then return end

    vim.schedule(function()
      if vim.api.nvim_win_is_valid(wid) then vim.api.nvim_set_current_win(wid) end
    end)
  end
end

local function create_nav_options(name)
  return {
    group = "DapGroup",
    pattern = string.format("*%s*", name),
    callback = navigate,
  }
end

return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      local dap = require "dap"

      dap.set_log_level "DEBUG"

      vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = "Visual" })

      local vscode       = require('dap.ext.vscode')
      local json         = require('plenary.json')
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      local function layout(name)
        return {
          elements = {
            { id = name },
          },
          enter = true,
          size = 40,
          position = "right",
        }
      end

      local name_to_layout = {
        repl = { layout = layout "repl", index = 0 },
        stacks = { layout = layout "stacks", index = 0 },
        scopes = { layout = layout "scopes", index = 0 },
        console = { layout = layout "console", index = 0 },
        watches = { layout = layout "watches", index = 0 },
        breakpoints = { layout = layout "breakpoints", index = 0 },
      }
      local layouts = {}

      for name, config in pairs(name_to_layout) do
        table.insert(layouts, config.layout)
        name_to_layout[name].index = #layouts
      end

      local function toggle_debug_ui(name)
        dapui.close()
        local layout_config = name_to_layout[name]

        if layout_config == nil then error(string.format("bad name: %s", name)) end

        local uis = vim.api.nvim_list_uis()[1]
        if uis ~= nil then layout_config.size = uis.width end

        pcall(dapui.toggle, layout_config.index)
      end

      local keymap = {
        ["r"] = "repl",
        ["s"] = "stacks",
        ["w"] = "watches",
        ["b"] = "breakpoints",
        ["S"] = "scopes",
        ["c"] = "console",
      }

      local function keymap_n(key, name)
        local desc = "Debug: Toggle " .. name:gsub("^%l", string.upper) .. "UI"
        vim.keymap.set("n", "<leader>dt" .. key, function() toggle_debug_ui(name) end, { desc = desc })
      end

      for key, name in pairs(keymap) do
        keymap_n(key, name)
      end

      vim.api.nvim_create_autocmd("BufEnter", {
        group = "DapGroup",
        pattern = "*dap-repl*",
        callback = function() vim.wo.wrap = true end,
      })

      vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options "dap-repl")
      vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options "DAP Watches")

      dapui.setup {
        layouts = layouts,
        enter = true,
      }

      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end

      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      dap.listeners.after.event_output.dapui_config = function(_, body)
        if body.category == "console" then dapui.eval(body.output) end
      end
    end,
  },
}
