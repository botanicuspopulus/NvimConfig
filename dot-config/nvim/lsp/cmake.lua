return {
  cmd = { 'neocmakelsp', "stdio" },
  filetypes = { 'cmake' },
  root_markers = { ".git", "CMakeLists.txt" },
  init_options = {
    format = { enable = true },
    lint = { enable = true },
    scan_cmake_in_package = true,
  },
}
