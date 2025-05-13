return {
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to
	filetypes = { "lua" },
	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = {
					-- vim.env.VIMRUNTIME,
					-- "${3rd}/luv/library",
					-- unpack(vim.api.nvim_get_runtime_file("", true)),
				},
			},
			diagnostics = { disable = { "missing-fields" } },
			format = {
				enable = false,
			},
		},
	},
}
