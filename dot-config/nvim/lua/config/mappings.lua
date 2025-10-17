local keymap = vim.keymap.set

local motion_keybinds = {
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

local buffer_keybinds = {
  { "n", "<leader>bb", "<cmd>e #<cr>", { desc = "Buffer: Switch to other" } },
  { "n", "<leader>bo", function() require("snacks").bufdelete.other() end, { desc = "Buffer: Delete Other" } },
  {
    "n",
    "<leader>bD",
    "<cmd>:bd<cr>",
    { desc = "Buffer: Delete Buffer and Window" },
  },
}

local window_keybinds = {
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
    "<leader>ws",
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
    "<leader>wv",
    "<C-W>v",
    group = "window",
    { desc = "Window: Split Right", remap = true },
  },
  {
    "n",
    "<leader>wd",
    "<C-W>c",
    group = "window",
    { desc = "Window: Delete", remap = true },
  },
}

local tab_keybinds = {
  -- tabs
  { "n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Tab: Last" } },
  { "n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Tab: Close Other" } },
  { "n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Tab: First" } },
  { "n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Tab: New" } },
  { "n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Tab: Next" } },
  { "n", "<leader><tab>[", "<cmd>tabprev<cr>", { desc = "Tab: Previous" } },
  { "n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Tab: Close" } },
}

local general_keybinds = {
  { "n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit" } },

  -- better indenting
  { "v", "<", "<gv" },
  { "v", ">", ">gv" },
}

local all_keybinds = {}

local extend_keybinds = function(keybind_table) vim.list_extend(all_keybinds, keybind_table) end

extend_keybinds(motion_keybinds)
extend_keybinds(buffer_keybinds)
extend_keybinds(window_keybinds)
extend_keybinds(tab_keybinds)
extend_keybinds(general_keybinds)

for _, keybind in ipairs(all_keybinds) do
  keymap(unpack(keybind))
end
