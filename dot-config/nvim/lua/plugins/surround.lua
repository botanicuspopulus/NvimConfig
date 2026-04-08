return {
  {
    "echasnovski/mini.surround",
    version = "*",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      disable_in_replace_mode = true,
      fast_wrap = { map = "<M-e>" },
    },
  },
}
