return {
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    ".git",
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
  },
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
    },
    javascript = {
      suggest = { completeFunctionCalls = true },
      updateImportsOnFileMove = { enabled = "always" },
    },
    typescript = {
      suggest = { completeFunctionCalls = true },
      updateImportsOnFileMove = { enabled = "always" },
    },
  },
}
