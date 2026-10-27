local blink_capabilities = require("blink.cmp").get_lsp_capabilities()

return {
  cmd = { "biome", "lsp-proxy" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  capabilities = blink_capabilities,
  init_options = {},
  -- Only attach in projects that have a biome config
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { "biome.json", "biome.jsonc" })
    if root then on_dir(root) end
  end,
}
