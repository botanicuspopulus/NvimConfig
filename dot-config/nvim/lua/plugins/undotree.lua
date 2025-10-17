return {
  'jiaoshijie/undotree',
  opts = {},
  keys = {
    { "<leader>ut", function() require("undotree").toggle() end, desc = "UndoTree: Toggle", mode = "n" }
  },
}
