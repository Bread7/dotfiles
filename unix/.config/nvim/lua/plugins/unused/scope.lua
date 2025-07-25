return {
	"tiagovla/scope.nvim",
	-- lazy = true,
	-- event = "VeryLazy",
	commit = "9321026",
	config = function()
		local scope = require("scope")
		scope.setup({
			hooks = {
                -- Integration for barbar
				pre_tab_leave = function()
					vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
				end,
				post_tab_enter = function()
					vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
				end,
			},
		})
	end,
}
