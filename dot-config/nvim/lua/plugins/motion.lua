return {
	{ "bkad/CamelCaseMotion", lazy = false },
	{ "wellle/targets.vim", lazy = false },
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		opts = {
			search = {
				-- search/jump in all windows
				multi_window = false,
				-- search direction
				forward = true,
				wrap = false,
				mode = function(str) return "\\<" .. str end,
				-- acts like incsearch
				incremental = true,
				exclude = {
					'notify',
					'noice',
					'cmp_menu',
					function(win)
						return not vim.api.nvim_win_get_config(win).focusable
					end
				},
			},
			jump = {
				-- save location in jumplist
				jumplist = true,
				pos = 'start',
				-- add pattern to search history
				history = false,
				-- add pattern to search register
				register = false,
				-- clear highlighting after jump
				nohlsearch = true,
				-- automatically jump when there is only one match
				autojump = false
			},
			modes = {
				search = {
					enabled = true,
					highlight = { backdrop = false },
					jump = {
						history = true,
						register = true,
						nohlsearch = true,
					},
					search = {},
				},
				char = {
					enabled = false,
					jump_labels = true,
					multi_line = false,
					keys = { 'f', 'F', 't', 'T', ',' },
					search = { wrap = false },
					highlight = { backdrop = true, groups = { label = "", backdrop = "" }},
					jump = { register = false },
				},
				treesitter = {
					labels = "abcdefghijklmnopqrstuvwxyz",
					jump = { pos = "range" },
					highlight = {
						label = { before = true, after = true,style = "inline" },
						backdrop = false,
						matches = false,
					},
				},
			},
		},
		keys = {
			'/',
			{
				"Ss",
				mode = { "n", "x" },
				function()
					require("flash").jump {
						search = {
							mode = function(str) return '\\<' .. str end,
						},
					}
				end,
				desc = "Flash",
			},
			{
				"St",
				mode = { "n", "o", "x" },
				function() require("flash").jump() end,
				desc = "Flash Treesitter",
			},
			{
				"Sr",
				mode = "o",
				function() require("flash").remote() end,
				desc = "Remote Flash",
			},
			{
				"SR",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc = "Treesitter Search",
			},
		},
	},
}
