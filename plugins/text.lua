return {
  -- LaTeX, Typst and markdown integrations
  { "lervag/vimtex", ft = { "tex", "bib" }, cmd = "VimtexInverseSearch" },
  { "kaarmu/typst.vim", ft = "typst" },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
