local ignore_files = {}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      stylua = { enabled = false },
      lua_ls = {
        settings = {
          Lua = {
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
            workspace = {
              checkThirdParty = false,
              ignoreDir = {
                ".git",
                "node_modules",
                ".vscode",
                "build",
                "dist",
                "build",
              },
              maxPreload = 2000,
              preloadFileSize = 500,
              useGitIgnore = true,
            },
            diagnostics = {
              workspaceDelay = 5000,
              workspaceEvent = "OnSave",
              workspaceRate = 50,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      },
    },
  },
}
