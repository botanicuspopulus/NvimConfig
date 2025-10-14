return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Buffer: Toggle Pin" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Buffer: Delete Non-Pinned Buffers" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Buffer: Delete Buffers to the Right" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Buffer: Delete Buffers to the Left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer: Previous Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer: Next Buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer: Previous Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer: Next Buffer" },
			{ "[B", "<cmd>BufferLineMovePrev<CR>", desc = "Buffer: Move Buffer Previous" },
			{ "]B", "<cmd>BufferLineMoveNext<CR>", desc = "Buffer: Move Buffer Next" },
		},
		opts = {
			options = {
				close_command = function(n)
					Snacks.bufdelete(n)
				end,
				right_mouse_command = function(n)
					Snacks.bufdelete(n)
				end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
			},
		},
		config = function(_, opts) 
      require('bufferline').setup(opts)

      vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
	},
}
