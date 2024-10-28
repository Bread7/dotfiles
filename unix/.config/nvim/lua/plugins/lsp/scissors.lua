-- ref: https://github.com/chrisgrieser/nvim-scissors
-- $HOME/.config/nvim/lua/code-snippets
return {
	"chrisgrieser/nvim-scissors",
    lazy = true,
    event = "VeryLazy",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
        local scissors = require("scissors")
		scissors.setup({
			snippetDir = vim.fn.expand("$HOME/.config/nvim/lua/code-snippets"), -- Custom dir, use `mkdir`
			-- snippetDir = "/Users/zj/.config/nvim/lua/code-snippets", -- Custom dir, use `mkdir`
			editSnippetPopup = {
				height = 0.4, -- relative to the editor, number between 0 and 1
				width = 0.6,
				border = "rounded",
				keymaps = {
					cancel = "q",
					saveChanges = "<CR>", -- alternatively, can also use `:w`
					goBackToSearch = "<BS>",
					deleteSnippet = "<C-d>",
					duplicateSnippet = "<C-D>",
					openInFile = "<C-o>",
					insertNextPlaceholder = "<C-p>", -- insert & normal mode
				},
			},
			backdrop = {
				enabled = true,
				blend = 50, -- between 0-100
			},
			-- `none` writes as a minified json file using `vim.encode.json`.
			-- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
			-- you version control your snippets. To use a custom formatter, set to a
			-- list of strings, which will then be passed to `vim.system()`.
			jsonFormatter = "none", -- "yq"|"jq"|"none"|table
		})

        vim.keymap.set({ "n", }, "<leader>se", function() scissors.editSnippet() end, { silent = true, desc = "Scissors: Edit snippet", })
        vim.keymap.set({ "n", "x", }, "<leader>sa", function() scissors.addNewSnippet() end, { silent = true, desc = "Scissors: Add snippet", })
	end,
}
