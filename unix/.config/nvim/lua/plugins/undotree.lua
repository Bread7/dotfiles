return {
	"jiaoshijie/undotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- lazy = true,
	-- event = "VeryLazy",
	config = function()
		local undotree = require("undotree")
		undotree.setup({
			keymaps = {
				["j"] = "move_next",
				["k"] = "move_prev",
				["gj"] = "move2parent",
				["J"] = "move_change_next",
				["K"] = "move_change_prev",
				["<cr>"] = "action_enter",
				["p"] = "enter_diffbuf",
				["q"] = "quit",
			},
		})
		vim.keymap.set("n", "<leader>u", undotree.toggle, { noremap = true, silent = true, desc = "Undotree: toggle" })
	end,
}
