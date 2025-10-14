return {
	{
		"MagicDuck/grug-far.nvim",
		cmd = { "GrugFar", "GrugFarWithin" },
		opts = {
			headerMaxWidth = 80,
      resultLocation = { showNumberLabel = true },
		},
		config = function(_, opts)
			require("grug-far").setup(opts)
			local grug = require("grug-far")

			vim.keymap.set({ "n", "v" }, "<leader>sr", function()
				local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")

				grug.open({
					transient = true,
					prefills = {
						filesFilter = ext and ext ~= "" and ("*." .. ext) or nil,
					},
				})
			end, { desc = "Search and Replace" })

      vim.keymap.set('n', '<leader>sf', function()
        grug.toggle_instance({
          instanceName = 'far',
          staticTitle = 'Search and Replace',
        })
      end, { desc = "Toggle Search and Replace" })

			vim.keymap.set({ "n" }, "<leader>s1", function()
				grug.open({ transient = true, prefills = { paths = vim.fn.expand("%") } })
			end, { desc = "Search and Replace (Current File)" })

			vim.keymap.set("n", "<leader>sw", function()
				grug.open({ transient = true, prefills = { search = vim.fn.expand("<cword>") } })
			end, { desc = "Search and Replace (Word)" })

      vim.keymap.set('x', '<leader>ss', function()
        grug.open({ transient = true })
      end, { desc = "Search and Replace (Use Selection)" })

      vim.keymap.set({ 'n', 'x' }, '<leader>si', function()
        grug.open({ visualSelectionUsage = 'operate-within-range' })
      end, { desc = 'Search and Replace (Within Selection)'})
		end,
	},
}
