-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gopls
return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotempl" },
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
}
