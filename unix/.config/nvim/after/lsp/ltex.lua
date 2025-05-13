-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ltex
return {
	cmd = { "ltex-ls" },
	filetypes = {
		"bib",
		"gitcommit",
		"markdown",
		"org",
		"plaintex",
		"rst",
		"rnoweb",
		"tex",
		"pandoc",
		"quarto",
		"rmd",
		"context",
		"html",
		"xhtml",
		"mail",
		"text",
	},
	root_markers = {
		".git",
	},
	settings = {
		ltex = {
			language = "en-GB",
			enabled = true,
			dictionary = {
				["en-GB"] = spell_words,
			},
		},
	},
}
