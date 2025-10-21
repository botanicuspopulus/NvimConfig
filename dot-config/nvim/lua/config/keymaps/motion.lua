return {
  -- Motion
  {
    { "n", "x" },
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    { desc = "Down", expr = true, silent = true },
  },
  {
    { "n", "x" },
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    { desc = "Up", expr = true, silent = true },
  },
  {
    { "n" },
    "<C-h>",
    "<C-w>h",
    { desc = "Window: Go Left", remap = true },
  },
  {
    { "n" },
    "<C-j>",
    "<C-w>j",
    { desc = "Window: Go Down", remap = true },
  },
  {
    { "n" },
    "<C-k>",
    "<C-w>k",
    { desc = "Window: Go Up", remap = true },
  },
  {
    { "n" },
    "<C-l>",
    "<C-w>l",
    { desc = "Window: Go Right", remap = true },
  },
}
