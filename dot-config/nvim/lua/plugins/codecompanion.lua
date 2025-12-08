local api_key = 'cmd:rbw get "openrouter.ai" --field "LLMAssist API Key"'

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup {
      adapters = {
        http = {
          kimi = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "kimi",
              env = {
                url = "https://openrouter.ai/api/v1",
                api_key = api_key,
                chat_url = "/chat/completions",
              },
              schema = {
                model = { default = "moonshotai/kimi-k2-thinking" },
              },
            })
          end,
          minimax = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "minimax",
              env = {
                url = "https://openrouter.ai/api/v1",
                api_key = api_key,
                chat_url = "/chat/completions",
              },
              schema = {
                model = { default = "minimax/minimax-m2" },
                temperature = { default = 0.1 },
              },
            })
          end,
        },
      },
      strategies = {
        chat = { adapter = "minimax" },
        inline = { adapter = "minimax" },
        agent = { adapter = "kimi" },
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            width = 0.35,
          },
        },
      },
    }
  end,
}
