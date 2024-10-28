return {
	"windwp/nvim-ts-autotag",
	-- lazy = true,
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false, -- Auto close on trailing </
				filetypes = {
					"templ",
				},
			},
			-- aliases = {
			-- 	["templ"] = "html",
			-- },

			-- Override individual filetype configs
			-- per_filetype = {
			-- ["html"] = {
			--     enable_close = false,
			-- },
			-- },
		})

		-- https://github.com/windwp/nvim-ts-autotag/issues/19
		-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		-- 	underline = true,
		-- 	virtual_text = {
		-- 		spacing = 5,
		-- 		severity_limit = "Warning",
		-- 	},
		-- 	update_in_insert = true,
		-- })
	end,
}
