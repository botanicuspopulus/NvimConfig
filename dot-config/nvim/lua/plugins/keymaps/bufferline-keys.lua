return {
  {
    "akinsho/bufferline.nvim",
		keys = {
			{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Buffer: Toggle Pin" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Buffer: Delete Non-Pinned Buffers" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Buffer: Delete Buffers to the Right" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Buffer: Delete Buffers to the Left" },
			{ "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer: Previous Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer: Next Buffer" },
			{ "[B", "<cmd>BufferLineMovePrev<CR>", desc = "Buffer: Move Buffer Previous" },
			{ "]B", "<cmd>BufferLineMoveNext<CR>", desc = "Buffer: Move Buffer Next" },
		},
  }
}
