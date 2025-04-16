return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot Auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = false,
        },
      },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              ai_accept = function()
                local copilot_suggestion = require "copilot.suggestion"
                if copilot_suggestion.is_visible() then
                  copilot_suggestion.accept()
                  return true
                end
              end,
            },
          },
        },
      },
    },
  },
}
