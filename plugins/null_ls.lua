return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, config)
      local null_ls = require "null-ls"

      config.sources = {
        -- Code Actions
        -- null_ls.builtins.code_actions.cspell,
      }
      return config
    end,
  },
}
