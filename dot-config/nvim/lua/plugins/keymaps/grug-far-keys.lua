local prefix = "<leader>s"
local default_instance_name = "grug-main"

local function grug_open(opts)
  local grug = require "grug-far"

  if not grug.has_instance(default_instance_name) then
    grug.open(vim.tbl_extend("force", { instanceName = default_instance_name }, opts or {}))
  else
    local instance = grug.get_instance(default_instance_name)

    instance:open()
    if opts and opts.prefills then instance:update_input_values(opts.prefills, false) end
  end
end

return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        prefix .. "r",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"

          grug_open {
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and ("*." .. ext) or nil,
            },
          }
        end,
        mode = { "n", "v" },
        desc = "Search/Replace",
      },
      {
        prefix .. "f",
        function()
          require("grug-far").toggle_instance {
            instanceName = default_instance_name,
            staticTitle = "Search/Replace",
          }
        end,
        mode = { "n" },
        desc = "Toggle Search/Replace",
      },
      {
        prefix .. "1",
        function() grug_open { transient = true, prefills = { paths = vim.fn.expand "%" } } end,
        mode = { "n" },
        desc = "Search/Replace (Current File)",
      },
      {
        prefix .. "w",
        function() 
          local current_word = vim.fn.expand "<cword>"

          if current_word ~= "" then
            grug_open { transient = true, prefills = { search = vim.fn.expand "<cword>" } } 
          else
            vim.notify("No word under cursor", vim.log.levels.WARN, { title = "Grug-far" })
          end

        end,
        desc = "Search/Replace (Word)",
        mode = { "n" },
      },
      {
        prefix .. "s",
        function()
          local selection = vim.fn.getregion(vim.fn.getpos ".", vim.fn.getpos "v", { type = vim.fn.mode() })
          grug_open { prefills = { search = table.concat(selection, "\n") } }
        end,
        desc = "Search/Replace (Use Selection)",
        mode = { "x" },
      },
      {
        prefix .. "i",
        function() grug_open { visualSelectionUsage = "operate-within-range" } end,
        desc = "Search/Replace (Within Selection)",
        mode = { "n", "x" },
      },
    },
  }
}
