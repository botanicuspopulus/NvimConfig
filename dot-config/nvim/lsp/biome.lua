local function has_biome_config(path)
  return vim.fn.filereadable(path .. "/biome.json") == 1 or vim.fn.filereadable(path .. "/biome.jsonc") == 1
end

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
  root_markers = { ".git", "biome.json", "biome.jsonc" },
  init_options = {},
  cond = function(root_dir) return has_biome_config(root_dir) end,
}
