return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { ".git" },
  settings = {
    html = {
      format = {
        enable = true,
        wrapLineLength = 120,
        wrapAttributes = "auto",
      },
      suggest = {
        angular1 = false,
        ionic = false,
      },
    },
  },
}
