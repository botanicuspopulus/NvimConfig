---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "LiadOz/nvim-dap-repl-highlights",
    },
    opts = {
      endwise = { enable = true },
      indent = { enable = true },
      matchup = {
        enable = true,
        include_match_words = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      ensure_installed = {
        "ada",
        "angular",
        "arduino",
        "asm",
        "awk",
        "bash",
        "bibtex",
        "bitbake",
        "comment",
        "c",
        "cmake",
        "cpp",
        "css",
        "csv",
        "cuda",
        "devicetree",
        "diff",
        "dockerfile",
        "dot",
        "doxygen",
        "editorconfig",
        "firrtl",
        "foam",
        "gdscript",
        "gdshader",
        "graphql",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "gnuplot",
        "html",
        "htmldjango",
        "http",
        "hyprlang",
        "ini",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "jsonc",
        "just",
        "kconfig",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "luau",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "meson",
        "ninja",
        "passwd",
        "php",
        "printf",
        "rasi",
        "readline",
        "regex",
        "scss",
        "sql",
        "ssh_config",
        "svelte",
        "tcl",
        "todotxt",
        "toml",
        "tsv",
        "typescript",
        "verilog",
        "vhdl",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
        "zathurarc",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.install").compilers = { "gcc" }
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "jsx",
        "svelte",
        "tsx",
        "typescript",
        "typescriptreact",
        "vue",
        "xml",
      },
    },
  },
}
