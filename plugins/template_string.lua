return {
    {
        'axelvc/template-string.nvim',
        lazy = false,
        opts = {
            jsx_brackets = true,
            remove_template_string = true,
            restore_quotes = {
                normal = [["]],
                jsx = [["]],
            },
        },
    }
}
