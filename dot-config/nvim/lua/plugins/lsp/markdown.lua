return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "markdownlint-cli2",
        "markdown-toc",
      },
    },
  },
  {
    "selimacerbas/markdown-preview.nvim",
    dependencies = { "selimacerbas/live-server.nvim" },
    ft = { "markdown" },
    config = function()
      require("markdown_preview").setup {
        instance_mode = "takeover",
        port = 0,
        open_browser = true,
        debounce_ms = 300,
        browser = "firefox",
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = { enabled = false },
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      require("snacks")
        .toggle({
          name = "Render Markdown",
          get = require("render-markdown").get,
          set = require("render-markdown").set,
        })
        :map "<leader>um"
    end,
  },
}
