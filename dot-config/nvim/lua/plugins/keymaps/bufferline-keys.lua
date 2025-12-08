local leader = "<leader>b"

return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { leader .. "p", "<cmd>BufferLineTogglePin<CR>", desc = "Buffer: Toggle Pin" },
      { leader .. "P", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Buffer: Delete Non-Pinned Buffers" },
      { leader .. "r", "<cmd>BufferLineCloseRight<CR>", desc = "Buffer: Delete Buffers to the Right" },
      { leader .. "l", "<cmd>BufferLineCloseLeft<CR>", desc = "Buffer: Delete Buffers to the Left" },
      { leader .. "p", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer: Previous Buffer" },
      { leader .. "n", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer: Next Buffer" },
      { leader .. "P", "<cmd>BufferLineMovePrev<CR>", desc = "Buffer: Move Buffer Previous" },
      { leader .. "N", "<cmd>BufferLineMoveNext<CR>", desc = "Buffer: Move Buffer Next" },
      { leader .. "o", "<cmd>BufferLineCloseOthers<CR>", desc = "Buffer: Close Other Buffers" },
      { leader .. "D", "<cmd>BufferLinePickClose<CR>", desc = "Buffer: Close Buffer (Pick)" },
      {
        leader .. "s",
        function()
          vim.cmd "split"
          vim.cmd "BufferLinePick"
        end,
        desc = "Buffer: Split in Horizontal Split",
      },
      {
        leader .. "S",
        function()
          vim.cmd "vsplit"
          vim.cmd "BufferLinePick"
        end,
        desc = "Buffer: Split in Vertical Split",
      },
    },
  },
}
