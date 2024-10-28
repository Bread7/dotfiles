return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	event = "VeryLazy",
	config = function()
		vim.opt.updatetime = 200

		require("barbecue").setup({
			-- ref: https://github.com/utilyre/barbecue.nvim/issues/35
			-- attach_navic = false,
			create_autocmd = false,
		})

		vim.api.nvim_create_autocmd({
			"WinScrolled",
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",

			-- Include if `show_modified` set to true
			-- "BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
