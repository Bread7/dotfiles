return {
	"epwalsh/obsidian.nvim",
	version = "*", -- Use latest release instead of latest commit
	lazy = true,
	-- event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		-- "BufReadPre path/to/my-vault/*.md",
		-- "BufNewFile path/to/my-vault/*.md",
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Documents/Obsidian/zj/*.md",
	},
	config = function()
		-- local vault_path = vim.fn.expand("$HOME/Documents/Obsidian/zj/")
		local obsidian = require("obsidian")
		obsidian.setup({
			workspaces = {
				{
					name = "zj",
					path = vim.fn.expand("$HOME/Documents/Obsidian/zj/"),
				},
			},
			picker = {
				name = "fzf-lua",
			},
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["<leader>gf"] = {
					action = function()
						return obsidian.util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true, desc = "Obsidian: Links passthrough" },
				},
			},
		})

		-- Increase conceal level for obsidian's UI
		vim.cmd("set conceallevel=1")
	end,
}
