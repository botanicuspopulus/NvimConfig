local function split_name(buf)
  local name = vim.fn.fnamemodify(buf.path, ":t")
  local ext = vim.fn.fnamemodify(buf.path, ":e")

  return name, ext
end

local groups = {
  options = {
    toggle_hidden_on_enter = true,
  },
  items = {
    {
      name = "C / C++ / CMake",
      highlight = { underline = false, sp = "cyan" },
      matcher = function(buf)
        local name, ext = split_name(buf)
        local match_options = { "c", "cpp", "h", "hpp", "cc", "cxx", "hh", "hxx", "cmake" }
        return vim.tbl_contains(match_options, ext) or name == "CMakeLists.txt"
      end,
    },
    {
      name = "Python",
      highlight = { underline = false, sp = "cyan" },
      matcher = function(buf)
        local name, ext = split_name(buf)
        return ext == "py" or name == "pyproject.toml"
      end,
    },
    {
      name = "Lua",
      highlight = { underline = false, sp = "red" },
      matcher = function(buf)
        return vim.fn.fnamemodify(buf.path, ":e") == "lua"
      end,
    },
    {
      name = "JSON",
      highlight = { underline = false, sp = "yellow" },
      matcher = function(buf)
        return vim.fn.fnamemodify(buf.path, ":e") == "json"
      end
    },
    {
      name = "Docs",
      highlight = { underline = false, sp = "magenta" },
      matcher = function(buf)
        local match_options = { "md", "markdown", "txt", "rst" }
        local name, ext = split_name(buf)
        return vim.tbl_contains(match_options, ext) or name == "README"
      end,
    },
    {
      name = "Shell",
      highlight = { underline = false, sp = "orange" },
      matcher = function(buf)
        local name, ext = split_name(buf)
        local match_options = { "sh", "bash", "zsh" }
        return vim.tbl_contains(match_options, ext) or name:match("^.?%rc")
      end,
    },
    {
      name = "Containers",
      hihlight = { underline = false, sp = "red" },
      matcher = function(buf)
        local name = vim.fn.fnamemodify(buf.path, ":t")
        local options = { "Dockerfile", "dockerfile", "Containerfile" }
        return vim.tbl_contains(options, name)
      end,
    }
  },
}

return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        close_command = function(n) require("snacks").bufdelete(n) end,
        right_mouse_command = function(n) require("snacks").bufdelete(n) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "snacks_layout_box",
            text = "󱏒  File Explorer",
            seperator = true,
          },
        },
        groups = groups,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)

      vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function() pcall(nvim_bufferline) end)
        end,
      })
    end,
  },
}
