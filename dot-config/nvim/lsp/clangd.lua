local root_markers = {
  "compile_commands.json",
  "compile_flags.txt",
  "configure.ac",
  "Makefile",
  "configure.in",
  "config.h.in",
  "meson.build",
  "meson_options.txt",
  "build.ninja",
  ".git",
}

local function get_project_root()
  local root = vim.fs.root(0, root_markers)

  if root then
    return root
  end

  return vim.fn.getcwd()
end

return  {
  root_markers = root_markers,
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
  filetypes = { "c", "cpp", "cuda" },
  cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
  },
  init_options = {
    usePlaceHolders = true,
    completeUnimported = true,
    clangFileStatus = true,
  },
  on_attach = function(client, bufnr) client.server_capabilities.semanticTokensProvider = nil end,
}
