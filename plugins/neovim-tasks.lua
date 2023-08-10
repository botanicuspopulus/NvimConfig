return {
  {
    "Shatur/neovim-tasks",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('neovim-tasks').setup({})
    end
  }
}
