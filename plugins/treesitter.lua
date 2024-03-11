return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bibtex",
                "dot",
                "graphql",
                "git_config",
                "gitcommit",
                "gitignore",
                "gitattributes",
                "ini",
                "jq",
                "jsdoc",
                "latex",
                "regex",
                "sql",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").compilers = { "gcc" }
            require("nvim-treesitter.configs").setup(opts)
        end,
    }, 
}
