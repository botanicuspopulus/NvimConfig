return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar", "GrugFarWithin" },
    event = "BufEnter",
    opts = {
      headerMaxWidth = 80,
      resultLocation = { showNumberLabel = true },
    },
  },
}
