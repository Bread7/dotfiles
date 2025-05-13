-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#basedpyright
return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		basedpyright = {
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				reportMissingTypeStubs = true,
				reportUndefinedVariable = "none", -- covered by ruff
				reportUnreachable = "none",
				reportUnusedImport = "none", -- covered by ruff
				typeCheckingMode = "basic", -- standard
				useLibraryCodeForTypes = true,
			},
			disableOrganizeImports = false,
		},
	},
	single_file_support = true,
}
