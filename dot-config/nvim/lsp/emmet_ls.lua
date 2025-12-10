return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "sass",
    "less",
    "javascriptreact",
    "typescriptreact",
    "svelte",
  },
  root_markers = { ".git" },
  init_options = {
    includeLanguages = {
      svelte = "html",
    },
    excludeLanguages = {},
    extensionsPath = {},
    preferences = {
      ["css.intUnit"] = "px",
      ["css.floatUnit"] = "rem",
    },
  },
}
