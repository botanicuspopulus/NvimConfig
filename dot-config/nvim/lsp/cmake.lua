return {
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_markers = { "CMakeLists.txt", ".git" },
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
