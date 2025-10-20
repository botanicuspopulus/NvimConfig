return {
  "iamcco/markdown-preview.nvim",
  lazy = true,
  keys = {
    {
      "<leader>cp",
      ft = "markdown",
      function() vim.cmd("MarkdownPreviewToggle") end,
      desc = "Markdown Preview",
    }
  }
}
