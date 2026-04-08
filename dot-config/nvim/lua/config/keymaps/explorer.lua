return {
  {
    "n",
    "<leader>ee",
    function() require("snacks").explorer() end,
    { desc = "File Explorer: Toggle" },
  },
  {
    "n",
    "<leader>eo",
    function()
      local snacks = require "snacks"
      local pickers = snacks.picker.get { source = "explorer" }

      local explorer_win = nil

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "snacks_picker_list" then
          explorer_win = win
          break
        end
      end

      if explorer_win and vim.api.nvim_get_current_win() ~= explorer_win then
        vim.api.nvim_set_current_win(explorer_win)
      else
        snacks.explorer()
      end
    end,

    { desc = "File Explorer: Focus" },
  },
}
