return {
  name = "Lua: Run Script",
  builder = function(_)
    return {
      cmd = { "lua" },
      args = { vim.fn.expand "%:p" },
      components = { "default" },
    }
  end,
  condition = { filetype = { "lua" } },
}
