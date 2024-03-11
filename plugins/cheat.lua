return {
  {
    "yorik1984/telescope-cheat.nvim",
     dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require('telescope').load_extension('cheat')
    end
  }
}
