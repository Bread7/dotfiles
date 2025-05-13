-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#golangci_lint_ls
return {
	cmd = { "golangci-lint-langserver" },
	filetypes = { "go", "gomod" },
	init_options = {
		command = { "golangci-lint", "run", "--output.json.path=stdout", "--show-stats=false" },
	},
	root_markers = {
		".golangci.yml",
		".golangci.yaml",
		".golangci.toml",
		".golangci.json",
		"go.work",
		"go.mod",
		".git",
	},
}
