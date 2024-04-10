return {
  "nvim-telescope/telescope.nvim",
  config = function(plugin, opts)
    if not opts.extensions then
      opts.extensions = {
        "undo",
        command_palette = {
          astronvim.user_opts("command_palette", {}),
        },
      }
    end
    require "plugins.configs.telescope"(plugin, opts)
  end,
}
