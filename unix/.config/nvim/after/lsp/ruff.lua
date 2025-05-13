-- See:  https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ruff
return {
	cmd = { "ruff", "server" },
	filetypes = {
		"python",
		"html",
		"twig",
		"hbs",
		"templ",
	},
	root_markers = {
		"pyproject.toml",
		"ruff.toml",
		".ruff.toml",
		".git",
	},
	single_file_support = true,
	settings = {},
}
