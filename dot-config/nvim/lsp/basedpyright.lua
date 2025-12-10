return {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml" },
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
}
