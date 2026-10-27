local window_prefix = "<leader>w"
return {
  -- windows
  {
    "n",
    "<leader>-",
    "<C-W>s",
    { desc = "Window: Split Below", remap = true },
  },
  {
    "n",
    window_prefix .. "s",
    "<C-W>s",
    { desc = "Window: Split Below", remap = true },
  },
  {
    "n",
    "<leader>|",
    "<C-W>v",
    { desc = "Window: Split Right", remap = true },
  },
  {
    "n",
    window_prefix .. "v",
    "<C-W>v",
    { desc = "Window: Split Right", remap = true },
  },
  {
    "n",
    window_prefix .. "d",
    "<C-W>c",
    { desc = "Window: Delete", remap = true },
  },
}
