return {
  "nvim-telescope/telescope.nvim",
  config = function(plugin, opts)
    if not opts.extensions then
      opts.extensions = {
        "undo",
        arecibo = {
          ["selected_engine"] = "duckduckgo",
        },
        command_palette = {
          astronvim.user_opts("command_palette", {}),
        },
      }
    end
    require "plugins.configs.telescope"(plugin, opts)
  end,
}
