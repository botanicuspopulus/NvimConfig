return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				local function map_n(lhs, rhs, desc)
					map("n", lhs, rhs, desc)
				end

				map_n("]c", function()
					gs.nav_chunk("next")
				end, "Git: Next Hunk")
				map_n("[c", function()
					gs.nav_chunk("prev")
				end, "Git: Prev Hunk")
				map_n("<leader>gsh", gs.stage_hunk, "Git: Stage Hunk")
				map_n("<leader>grh", gs.reset_hunk, "Git: Reset Hunk")
				map_n("<leader>gph", gs.preview_hunk, "Git: Preview Hunk")
        map_n("<leader>gbl", function() gs.blame_line({ full = true }) end, "Git: Blame Line")
			end,
		})
	end,
}
