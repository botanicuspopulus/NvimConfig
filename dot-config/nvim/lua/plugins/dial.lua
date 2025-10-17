return {
  "monaqa/dial.nvim",
  desc = 'Increment and decrement numbers, dates, and more',
  opts = function ()
    local augend = require('dial.augend')

    local logical_alias = augend.constant.new({
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    })

    local ordinal_numbers = augend.constant.new({
      elements = {
        'first',
        'second',
        'third',
        'fourth',
        'fifth',
        'sixth',
        'seventh',
        'eighth',
        'ninth',
        'tenth',
      },
      word = false,
      cyclic = true,
    })

    local weekdays = augend.constant.new({
      elements = {
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      },
      word = true,
      cyclic = true,
    })

    local months = augend.constant.new({
      elements = {
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      },
      word = true,
      cyclic = true,
    })

    local capitalized_boolean = augend.constant.new({
      elements = {
        "True",
        'False',
      },
      word = true,
      cyclic = true,
    })

    return {
      dials_by_ft = {
        css = 'css',
        javascript = 'typescript',
        typescript = 'typescript',
        json = 'json',
        lua = 'lua',
        markdown = 'markdown',
        sass = 'css',
        scss = 'scss',
        python = 'python',
      },
      groups = {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.date.alias['%Y/%m/%d'],
          ordinal_numbers,
          weekdays,
          months,
          capitalized_boolean,
          augend.constant.alias.bool,
          logical_alias,
        },
        typescript = { augend.constant.new({ elements = { 'let', 'const' } }), },
        css = { 
          augend.hexcolor.new({ case = 'lower', }),
          augend.hexcolor.new({ case = 'upper', }),
        },
        markdown = {
          augend.constant.new({
            elements = { '[ ]', '[x]' },
            word = false,
            cyclic = false,
          }),
          augend.misc.alias.markdown_header,
        },
        json = { augend.semver.alias.semver }
      },
      lua = {
        augend.constant.new({
          elements = { 'and', 'or' },
          word = true,
          cyclic = true,
        }),
      },
      python = {
        augend.constant.new({ elements = { 'and', 'or' }, }),
      },
    }
  end,
  config = function(_, opts)
    for name, group in pairs(opts.groups) do
      if name ~= 'default' then vim.list_extend(group, opts.groups.default) end
    end

    require('dial.config').augends:register_group(opts.groups)
    vim.g.dials_by_ft = opts.dials_by_ft
  end,
}
