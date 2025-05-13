-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jsonls
-- See: https://github.com/feoh/neovim_config_experimental/blob/1f43298792b9f091cd66e3518216911e626780ef/lsp/json_ls.lua
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	handlers = {
		["textDocument/publishDiagnostics"] = function(err, result, ctx)
			result.diagnostics = vim.tbl_filter(function(diagnostic)
				-- disable diagnostics for trailing comma in JSONC
				if diagnostic.code == 519 then
					return false
				end

				return true
			end, result.diagnostics)
			vim.lsp.handlers[ctx.method](err, result, ctx)
		end,
	},
	init_options = {
		provideFormatter = true,
	},
	root_markers = { ".git" },
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{
					fileMatch = {
						".eslintrc",
						".eslintrc.json",
					},
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "http://json.schemastore.org/stylelintrc.json",
				},
			},
		},
	},
}
