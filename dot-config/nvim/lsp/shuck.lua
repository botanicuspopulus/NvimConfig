-- bashls/shellcheck don't understand zsh, so shuck handles zsh only
return {
  cmd = { "shuck", "server" },
  filetypes = { "zsh" },
  root_markers = { ".shuck.toml", ".git" },
}
