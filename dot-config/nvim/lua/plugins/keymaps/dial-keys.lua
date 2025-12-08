local M = {}

M.dial = function(increment, global)
  local mode = vim.fn.mode(true)

  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_" ) .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"

  return require("dial.map")[func](group)
end

return {
  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", function() return M.dial(true) end, expr = true, desc = "Increment", mode = { "n", "v" } },
      { "<C-x>", function() return M.dial(false) end, expr = true, desc = "Decrement", mode = { "n", "v" } },
      { "g<C-a>", function() return M.dial(true, true) end, expr = true, desc = "Increment", mode = { "n", "v" } },
      { "g<C-x>", function() return M.dial(false, true) end, expr = true, desc = "Decrement", mode = { "n", "v" } },
    },
  },
}
