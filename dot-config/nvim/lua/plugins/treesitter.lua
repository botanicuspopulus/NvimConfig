---@type LazySpec
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            endwise = { enable = true },
            matchup = {
                enable = true,
                include_match_words = true,
            },
            ensure_installed = {
                "bash",
                "bibtex",
                "comment",
                "css",
                "diff",
                "dot",
                "graphql",
                "git_config",
                "gitcommit",
                "gitignore",
                "gitattributes",
                "html",
                "http",
                "ini",
                "javascript",
                "jsdoc",
                "jq",
                "jsdoc",
                "jsonc",
                "latex",
                "lua",
                "luadoc",
                "luap",
                "make",
                "markdown",
                "markdown_inline",
                "php",
                "regex",
                "scss",
                "sql",
                "svelte",
                "todotxt",
                "toml",
                "vue"
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").compilers = { "gcc" }
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        opts = {
            filetypes = {
                'html',
                'javascript',
                'javascriptreact',
                'jsx',
                'svelte',
                'tsx',
                'typescript',
                'typescriptreact',
                'vue',
                'xml',
            }
        }
    }
}
