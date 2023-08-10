local telescope = require('telescope')
local telescope_config = require('telescope.config')

return {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts)
      if not opts.extensions then
        opts.extensions = {
          "undo",
          arecibo = {
            ["selected_engine"] = 'duckduckgo',
          }
        }
      end
      opts.extensions.command_palette = astronvim.user_opts("command_palette", {})
      require "plugins.configs.telescope"(plugin, opts)
    end,
  }
