return {
	"HakonHarnes/img-clip.nvim",
	enabled = vim.fn.executable("pngpaste") == 1 or vim.fn.executable("xclip") == 1,
	lazy = true,
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Img-Clip: Paste image in markdown" },
	},
}
