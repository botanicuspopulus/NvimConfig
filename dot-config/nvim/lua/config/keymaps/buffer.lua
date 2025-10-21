-- Buffer
local buffer_prefix = "<leader>b"
return {
  {
    buffer_prefix .. "d",
    function() require("snacks").bufdelete() end,
    desc = "Buffer: Delete",
  },
  {
    buffer_prefix .. "o",
    function() require("snacks").bufdelete() end,
    desc = "Buffer: Delete Others",
  },
  {
    buffer_prefix .. "D",
    "<cmd>:bd<cr>",
    desc = "Buffer: Delete Buffer and Window",
  },
}
