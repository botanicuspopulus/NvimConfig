return {
  generator = function(_, cb)
    local tasks = {}

    if vim.bo.filetype == "python" then
      if vim.fn.filereadable "pyproject.toml" == 1 and vim.fn.executable "uv" == 1 then
        table.insert(tasks, {
          name = "Python: UV Run",
          builder = function(_)
            return {
              cmd = { "uv" },
              args = { "run", vim.fn.expand "%:p" },
              components = { "default", "on_output_quickfix" },
            }
          end,
          priority = 50,
        })

        table.insert(tasks, {
          name = "Python: UV Add",
          params = {
            package = {
              type = "string",
              desc = "Package name to add",
              optional = false,
            },
            dev = {
              type = "boolean",
              desc = "Add as dev dependency (--dev)?",
              default = false,
            },
          },
          builder = function(params)
            local args = { "add" }
            if params.dev then table.insert(args, "--dev") end

            table.insert(args, params.package)
            return {
              cmd = { "uv" },
              args = args,
              components = { "deafult", "on_output_quickfix" },
            }
          end,
        })
      end

      if vim.fn.executable "python" == 1 or vim.fn.executable "python3" == 1 then
        table.insert(tasks, {
          name = "Python: Run",
          builder = function(_)
            return {
              cmd = { "python" },
              args = { vim.fn.expand "%:p" },
              components = { "default", "on_output_quickfix" },
            }
          end,
          priority = 50,
        })

        table.insert(tasks, {
          name = "Python: Run Pytest",
          builder = function(_)
            return {
              cmd = { "pytest" },
              args = { vim.fn.expand "%:p" },
              components = { "default", "on_output_quickfix" },
            }
          end,
          priority = 50,
        })
      end
    end

    cb(tasks)
  end,
}
