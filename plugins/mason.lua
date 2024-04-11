-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "clangd",
        "awk_ls",
        "ansiblels",
        "asm_lsp",
        "autotools_ls",
        "bashls",
        "clangd",
        "cmake",
        "neocmake",
        "cssls",
        "cssmodules_ls",
        "codeqlls",
        "denols",
        "dockerls",
        "docker_compose_language_service",
        "efm",
        "eslint",
        "hdl_checker",
        "html",
        "jsonls",
        "tsserver",
        "jinja_lsp",
        "jsonnet_ls",
        "julials",
        "jqls",
        "texlab",
        "marksman",
        "spectral",
        "pyre",
        "pyright",
        "pylyzer",
        "pylsp",
        "ruff_lsp",
        "svelte",
        "stylelint_lsp",
        "svlangserver",
        "svls",
        "verible",
        "taplo",
        "vtsls",
        "vimls",
        "lemminx",
        "yamlls"
        -- add more arguments for adding more language servers
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
        "beautysh",
        "jsonlint",
        "luacheck",
        "mypy",
        "pydocstyle",
        "pylint",
        "sql_formatter",
        "yamlfmt",
        "yamllint",
        -- add more arguments for adding more null-ls sources
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
