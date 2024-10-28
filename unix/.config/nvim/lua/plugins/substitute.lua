return {
	"chrisgrieser/nvim-rip-substitute",
	lazy = true,
	event = "VeryLazy",
	cmd = "RipSubstitute",
	config = function()
		require("rip-substitute").setup({})
		vim.keymap.set({ "n", "x" }, "<leader>rs", function()
			require("rip-substitute").sub()
		end, { desc = " rip substitute" })
	end,
}
