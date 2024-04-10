return {
  "nvim-telescope/telescope.nvim",
  config = function(plugin, opts)
    if not opts.extensions then opts.extensions = {
      "undo",
    } end
    require "astronvim.plugins.configs.telescope"(plugin, opts)
  end,
}
