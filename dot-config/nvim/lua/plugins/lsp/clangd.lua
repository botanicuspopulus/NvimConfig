return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          {
            keys = {
              { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            },
            root_markers = {
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
            },
            capabilities = {
              offsetEncoding = { "utf-16" },
            },
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
          },
        },
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
    }
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require "dap"

      if not dap.adapters["codelldb"] then
        dap.adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end

      for _, lang in pairs { "c", "cpp" } do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "Launch",
            name = "Launch file",
            program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "codelldb" },
    },
  },
}
