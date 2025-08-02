return {
	"andymass/vim-matchup",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local g = vim.g
		g.matchup_matchparen_offscreen = {
			method = "popup",
		}
		g.matchup_surround_enabled = 1
		g.matchup_transmute_enabled = 1
		g.matchup_treesitter_stopline = 500
	end,
}
