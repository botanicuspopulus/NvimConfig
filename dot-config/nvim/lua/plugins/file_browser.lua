return {
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim',
		},
		config = function()
			local actions = require('telescope.actions')
			local fb_actions = require('telescope').extensions.file_browser.actions
			require('telescope').setup({
				extensions = {
					file_browser = {
						path = "%:p:h",
						mappings = {
							i = {
								['<C-t>'] = actions.select_tab,
								['<C-z>'] = fb_actions.change_cwd,
							},
							n = {
								t = actions.select_tab,
								z = fb_actions.change_cwd,
							},
						},
					},
				},
			})
			require('telescope').load_extension('file_browser')
		end,
		event = "User AstroFile",
		keys = {
			{
				'<leader>fe',
				'<cmd>Telescope file_browser<cr>',
				desc = 'File explorer',
			},
		},
	}
}
