return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		spec = {
			{
				mode = { "n", "v" },
				{
					{ "<leader>f", group = "file/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>gh", group = "hunks" },
					{ "<leader>ui", group = "ui" },
					{
						"<leader>b",
						group = "buffer",
            expand = function()
              return require('which-key.extras').expand.buf()
            end,
					},
          {
            "<leader>w",
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require('which-key.extras').expand.win()
            end,
          },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "z", group = "fold" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
