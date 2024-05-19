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
        "pylsp",
        "ruff_lsp",
        "svelte",
        "stylelint_lsp",
        "svlangserver",
        "svls",
        "verible",
        "taplo",
        "vtsls",
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
        "checkmake",
        "clang_format",
        "cmake_format",
        "cmake_lint",
        "codespell",
        "d2_fmt",
        "djhtml",
        "djlint",
        "mypy",
        "prettier_d",
        "pylint",
        "spell",
        "stylua",
        "tidy",
        "yamlfmt",
        "yamllint",
        "dotenv_linter",
        "editorconfig_checker",
        "gccdiag",
        "markdownlint",
        "rstcheck",
        "verilator",
        "yamlliint",
        -- add more arguments for adding more null-ls sources
      })
    end,
    config = function(_, opts)
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Completion
          null_ls.builtins.completion.spell,
          null_ls.builtins.completion.tags,
          null_ls.builtins.completion.luasnip,

          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.cmake_format,
          null_ls.builtins.formatting.codespell,
          null_ls.builtins.formatting.d2_fmt,
          null_ls.builtins.formatting.djhtml,
          null_ls.builtins.formatting.djlint,
          null_ls.builtins.formatting.prettier_d,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.tidy,
          null_ls.builtins.formatting.yamlfmt,

          null_ls.builtins.diagnostics.checkmake,
          null_ls.builtins.diagnostics.cmake_lint,
          null_ls.builtins.diagnostics.codespell,
          null_ls.builtins.diagnostics.cppcheck,
          null_ls.builtins.diagnostics.djlint,
          null_ls.builtins.diagnostics.dotenv_linter,
          null_ls.builtins.diagnostics.editorconfig_checker,
          null_ls.builtins.diagnostics.gccdiag,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.rstcheck,
          null_ls.builtins.diagnostics.trail_space,
          null_ls.builtins.diagnostics.verilator,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.zsh,


          null_ls.builtins.code_actions.refactoring,

      }})
    end
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
