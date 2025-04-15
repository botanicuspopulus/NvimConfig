return {
  generator = function(_, cb)
    local tasks = {}

    if vim.fn.filereadable "CMakeLists.txt" == 1 then
      table.insert(tasks, {
        name = "CMake: Build",
        builder = function(_)
          return {
            cmd = { "cmake" },
            args = { "--build", "build" },
            components = { "default", "on_output_quickfix" },
          }
        end,
        priority = 50,
      })

      table.insert(tasks, {
        name = "CMake: Test",
        builder = function(_)
          return {
            cmd = { "ctest" },
            args = { "--test-dir", "build" },
            components = { "default", "on_output_quickfix" },
          }
        end,
        priority = 50,
      })
    end

    cb(tasks)
  end,
}
