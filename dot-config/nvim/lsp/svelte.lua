return {
  cmd = { "svelte-language-server", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { ".git", "svelte.config.js", "svelte.config.ts", "package.json" },
  init_options = {
    configuration = {
      svelte = {
        plugin = {
          html = {
            completions = {
              emmet = true,
            },
          },
          css = {
            completions = {
              emmet = true,
            },
          },
        },
      },
    },
  },
}
