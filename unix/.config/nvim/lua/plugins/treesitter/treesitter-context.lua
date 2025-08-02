return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = true,
	event = "VeryLazy",
	config = function()
		require("treesitter-context").setup({
			max_lines = 1,
			multiwindow = true,
		})
	end,
}
