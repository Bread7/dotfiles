return {
	cmd = { "ty", "server" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},
	root_dir = vim.fs.root(0, { ".git/", "pyproject.toml" }),
	settingss = {},
}
