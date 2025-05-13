-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dockerls
return {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	root_markers = { "Dockerfile" },
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		},
	},
}
