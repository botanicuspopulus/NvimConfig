local window_prefix = "<leader>w"
return {
  -- windows
  {
    "n",
    "<leader>-",
    "<C-W>s",
    group = "window",
    { desc = "Window: Split Below", remap = true },
  },
  {
    "n",
    window_prefix .. "s",
    "<C-W>s",
    group = "window",
    { desc = "Window: Split Below", remap = true },
  },
  {
    "n",
    "<leader>|",
    "<C-W>v",
    group = "window",
    { desc = "Window: Split Right", remap = true },
  },
  {
    "n",
    window_prefix .. "v",
    "<C-W>v",
    group = "window",
    { desc = "Window: Split Right", remap = true },
  },
  {
    "n",
    window_prefix .. "d",
    "<C-W>c",
    group = "window",
    { desc = "Window: Delete", remap = true },
  },
}
