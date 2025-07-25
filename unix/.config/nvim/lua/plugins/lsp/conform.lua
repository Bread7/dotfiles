return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "VeryLazy",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "shellharden", "shfmt" },
				go = { "gofumpt" },
				-- python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
