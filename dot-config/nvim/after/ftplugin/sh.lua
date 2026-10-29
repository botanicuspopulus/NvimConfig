vim.g.is_bash = 1
vim.opt_local.makeprg = "shellcheck -f gcc %"
vim.keymap.set("n", "<leader>rr", "<cmd>!bash %<cr>", { buffer = true, desc = "Run script" })
