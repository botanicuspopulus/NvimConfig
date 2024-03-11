return {
  {
    'paopaol/telescope-git-diffs.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function()
      require('telescope').load_extension('git_diffs')
    end
  }
}
