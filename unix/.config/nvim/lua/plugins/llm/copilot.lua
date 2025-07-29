return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
					layout = {
						postion = "right",
						ratio = 0.4,
					},
				},
				suggestions = {
					enabled = false,
				},
				filetypes = {
					markdown = true,
					env = false,
				},
			})
			-- Disable Copilot by default
			vim.cmd("Copilot disable")
		end,
		-- https://github.com/LazyVim/LazyVim/discussions/4232
		keys = {
			{
				"<leader>'",
				function()
					if require("copilot.client").is_disabled() then
						require("copilot.command").enable()
					else
						require("copilot.command").disable()
					end
				end,
				silent = true,
				noremap = true,
				desc = "Copilot: Enable/Disable",
			},
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({})
		end,
	},
}
