-- Buffer
local buffer_prefix = "<leader>b"
return {
  {
    "n",
    buffer_prefix .. "d",
    function() require("snacks").bufdelete() end,
    { desc = "Buffer: Delete" },
  },
  {
    "n",
    buffer_prefix .. "o",
    function() require("snacks").bufdelete() end,
    { desc = "Buffer: Delete Others" },
  },
  {
    "n",
    buffer_prefix .. "D",
    function() vim.cmd(":bd") end,
    { desc = "Buffer: Delete Buffer and Window" },
  },
}
