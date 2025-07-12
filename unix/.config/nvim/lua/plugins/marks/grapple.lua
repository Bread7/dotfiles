return {
	"cbochs/grapple.nvim",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local grapple = require("grapple")
		grapple.setup({})

		-- Set background colour for grapple window
		vim.api.nvim_set_hl(0, "GrappleFloat", { bg = "#221f24" })
		vim.api.nvim_set_hl(0, "GrappleNormal", { bg = "#221f24" })
	end,
	keys = {
		{ "<leader>gg", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple: Toggle tags menu" },
		-- { "<leader>ga", "<cmd>Grapple toggle<cr>", desc = "Grapple: Tag current file" },
		{ "<leader>g[", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple: Cycle previous tag" },
		{ "<leader>g]", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple: Cycle next tag" },
		{
			"<leader>ga",
			"<cmd>Grapple tag<cr>",
			desc = "Grapple: Add tag on current buffer, index, line and path (1 per scope)",
		},
		{ "<leader>gu", "<cmd>Grapple untag<cr>", desc = "Grapple: Untag on current buffer, index, line and path" },
		-- { "<leader>g", "<cmd>Grapple <cr>", desc = "Grapple: " },
	},
}
