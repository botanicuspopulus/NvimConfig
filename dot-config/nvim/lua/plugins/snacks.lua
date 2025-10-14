return {
  {
		"folke/snacks.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		priority = 1000,
		lazy = false,
		opts = {
			explorer = { enabled = true },
			bigfile = { enabled = true },
			picker = { enabled = true },
			indent = {
				enabled = true,
				only_scope = true,
				only_current = true,
			},
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			scratch = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end

					if vim.fn.has("nvim-0.11") == 1 then
						vim._print = function(_, ...)
							dd(...)
						end
					else
						vim.print = _G.dd
					end

					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.inlay_hints():map("<leader>uh")
				end,
			})
		end,
		keys = {
			-- Explorer
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			-- Scratch
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>sS",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			-- Find
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Find: Buffers",
			},
			{
				"<leader>fF",
				function()
					Snacks.picker.smart()
				end,
				desc = "Find: Files (Root)",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files({ root = false })
				end,
				desc = "Find: Files (pwd)",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Find: Help",
			},
			{
				"<leader>fH",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Find: Command History",
			},
			{
				"<leader>f:",
				function()
					Snacks.picker.commands()
				end,
				desc = "Find: Commands",
			},
			{
				"<leader>f/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Find: Grep",
			},
			{
				"<leader>fB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Find: Grep Open Buffers",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Find: Visual Selection or Word",
				mode = { "n", "x" },
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_fiiles()
				end,
				desc = "Find: Git Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Find: Recent Files",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find: Config File",
			},
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Find: Project",
			},
			{
				"<leader>fn",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Find: Notification History",
			},
			{
				"<leader>fu",
				function()
					Snacks.picker.undo()
				end,
				desc = "Find: Undo History",
			},
			{
				"<leader>fm",
				function()
					Snacks.picker.man()
				end,
				desc = "Find: Man Pages",
			},
			{
				"<leader>fM",
				function()
					Snacks.picker.marks()
				end,
				desc = "Find: Marks",
			},
			{
				"<leader>f@",
				function()
					Snacks.picker.registers()
				end,
				desc = "Find: Registers",
			},
			{
				"<leader>fk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Find: Keymaps",
			},
			{
				"<leader>fj",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Find: Jumps",
			},
			{
				"<leader>fl",
				function()
					Snacks.picker.lines()
				end,
				desc = "Find: Lines",
			},
			{
				"<leader>fi",
				function()
					Snacks.picker.icons()
				end,
				desc = "Find: Icons",
			},
			-- Git
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git: Branches",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git: Log",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git: Log Line",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git: Status",
			},
			{
				"<leader>gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git: Stash",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git: Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git: Log File",
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Git: Lazygit",
			},
			-- LSP
			{
				"<leader>ls",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP: Symbols",
			},
			{
				"<leader>lS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP: Workspace Symbols",
			},
			-- Other
			{
				"<leader>rf",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Buffer: Delete",
			},
			{
				"<leader>tt",
				function()
					Snacks.terminal()
				end,
				desc = "Terminal: Toggle",
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Previous Reference",
				mode = { "n", "t" },
			},
		},
	},
}
