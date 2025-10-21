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
      local snacks = require('snacks')
      local pickers = snacks.picker.get { source = "explorer" }

      if #pickers > 0 then
        local explorer = pickers[1]
        local current_win = vim.api.nvim_get_current_win()

        if current_win == explorer.input.win.win then
          vim.cmd "wincmd p"
        else
          explorer.input.win:focus()
        end
      else
        snacks.explorer()
      end
    end,
    { desc = "File Explorer: Focus" },
  },
}
