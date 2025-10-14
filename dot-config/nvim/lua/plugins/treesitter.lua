return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VeryLazy" },
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"latex",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			folds = { enable = true },
			config = function(_, opts)
				require("nvim-treesitter.configs").setup(opts)
			end,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		branch = "main",
		opts = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				keys = {
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
						["]A"] = "@parameter.inner",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
					},
				},
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("nvim_treesitter_textobjects", { clear = true }),
				callback = function(ev)
					local moves = vim.tbl_get(opts, "move", "keys") or {}

					for method, keymaps in pairs(moves) do
						for key, query in pairs(keymaps) do
							local desc = query:gsub("@", ""):gsub("%..*", "")
							desc = desc:sub(1, 1):upper() .. desc:sub(2)
							desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc
							desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start")

							if not (vim.wo.diff and key:find("[cC]")) then
								vim.keymap.set({ "n", "x", "o" }, key, function() 
                  require('nvim-treesitter-textobjects.move')[method](query, 'textobjects')
                end, {
									buffer = ev.buf,
									desc = desc,
									silent = true,
								})
							end
						end
					end
				end,
			})
		end,
	},
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {},
  },
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  }
}
