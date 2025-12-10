return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml", "ruff.toml" },
  init_options = {
    settings = { args = {} },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
}
