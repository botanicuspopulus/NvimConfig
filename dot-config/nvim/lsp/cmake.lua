return {
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_dir = function(fname) return vim.fs.root(fname, { "CMakeLists.txt", ".git" }) end,
  single_file_support = true,
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
        relative_pattern_support = true,
      },
    },
    textDocument = {
      completion = {
        completionItem = { snippetSupport = true },
      },
    },
  },
  init_options = {
    format = { enable = true },
    lint = { enable = true },
    scan_cmake_in_package = true,
    semantic_token = false,
  },
}
