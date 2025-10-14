return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			local opts = {
				options = {
					icons_enabled = true,
					theme = "auto",
					always_divide_middle = true,
					always_show_tabline = false,
					globalstatus = vim.opt.laststatus == 3,
					disabled_filetypes = {
						status_line = {},
						winbar = {},
					},
					ignore_focus = {},
					refresh = {
						statusline = 100,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 16,
						events = {
							"WinEnter",
							"BufEnter",
							"BufWritePost",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
						},
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						{
							"diff",
							colored = true,
							diff_color = {
								added = "LuaLineDiffAdd",
								modified = "LuaLineDiffChange",
								removed = "LuaLineDiffDelete",
							},
              symbols = { added = '+', modified = '~', removed = '-' },
              source = nil,
						},
					},
					lualine_c = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							sections = { "error", "warn", "info", "hint" },
							symbols = { error = "E", warn = "W", info = "I", hint = "H" },
							diagnostic_color = {
								error = "DiagnosticError",
								warn = "DiagnosticWarn",
								info = "DiagnosticInfo",
								hint = "DiagnosticHint",
							},
							colored = true,
							update_in_insert = false,
							always_visible = false,
						},
						{ "filename", path = 1, symbols = { modified = " [+]", unnamed = "[No Name]" } },
					},
					lualine_x = {
						"encoding",
						"fileformat",
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = { 'man', 'mason', 'lazy', 'oil', 'overseer', 'quickfix', 'symbols-outline', 'trouble' },
			}

			return opts
		end,
	},
}
