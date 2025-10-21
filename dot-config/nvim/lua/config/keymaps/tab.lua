local tab_prefix = "<leader><tab>"
return {
  -- tabs
  { "n", tab_prefix .. "l", "<cmd>tablast<cr>", { desc = "Tab: Last" } },
  { "n", tab_prefix .. "o", "<cmd>tabonly<cr>", { desc = "Tab: Close Other" } },
  { "n", tab_prefix .. "f", "<cmd>tabfirst<cr>", { desc = "Tab: First" } },
  { "n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Tab: New" } },
  { "n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Tab: Next" } },
  { "n", "<leader><tab>[", "<cmd>tabprev<cr>", { desc = "Tab: Previous" } },
  { "n", tab_prefix .. "d", "<cmd>tabclose<cr>", { desc = "Tab: Close" } },
}
