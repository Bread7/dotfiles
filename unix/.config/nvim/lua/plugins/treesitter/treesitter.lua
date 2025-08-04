--- Refer: https://github.com/fredrikaverpil/dotfiles/blob/main/nvim-fredrik/lua/fredrik/plugins/core/treesitter.lua

--- Register parsers from opts.ensure_installed
local function register(ensure_installed)
	for filetype, parser in pairs(ensure_installed) do
		local filetypes = vim.treesitter.language.get_filetypes(parser)
		if not vim.tbl_contains(filetypes, filetype) then
			table.insert(filetypes, filetype)
		end

		-- register and start parsers for filetypes
		vim.treesitter.language.register(parser, filetypes)
	end
end

--- Install and start parsers for nvim-treesitter.
local function install_and_start()
	-- Auto-install and start treesitter parser for any buffer with a registered filetype
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		callback = function(event)
			local bufnr = event.buf
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

			-- Skip if no filetype
			if filetype == "" then
				return
			end

			-- Get parser name based on filetype
			local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
			if not parser_name then
				return
			end
			-- Try to get existing parser (helpful check if filetype was returned above)
			local parser_configs = require("nvim-treesitter.parsers")
			if not parser_configs[parser_name] then
				return -- Parser not available, skip silently
			end

			local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

			if not parser_installed then
				-- If not installed, install parser synchronously
				require("nvim-treesitter").install({ parser_name }):wait(30000)
			end

			-- let's check again
			parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

			if parser_installed then
				-- Start treesitter for this buffer
				vim.treesitter.start(bufnr, parser_name)
			end
		end,
	})
end

local function fix_python_highlight()
	-- let python docstrings be comments instead of screaming-loud-multiline-strings
	vim.api.nvim_set_hl(0, "@string.documentation", { link = "Comment" })
	-- this tramples over injections (e.g. printf/sql/...) across many langs: unlink it
	vim.api.nvim_set_hl(0, "@lsp.type.string", {})
	-- unlink overly generic tokens from basedpyright that undo treesitter
	vim.api.nvim_set_hl(0, "@lsp.type.variable.python", {})
	vim.api.nvim_set_hl(0, "@lsp.type.class.python", {})

	-- now actually put LSP to use:
	-- let LSP indicate property type
	vim.api.nvim_set_hl(0, "@lsp.type.property", { link = "@property" })
	vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { link = "@property" })
	-- let LSP indicate parameters
	vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "NvimLightYellow" })
	vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { fg = "NvimLightYellow" })
	-- let LSP indicate builtins
	vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
	vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
	-- let LSP indicate statics
	vim.api.nvim_set_hl(0, "@lsp.typemod.enumMember.static", { link = "@constant" })
	vim.api.nvim_set_hl(0, "@lsp.typemod.method.static", { link = "@constant" })
	vim.api.nvim_set_hl(0, "@lsp.typemod.property.static", { link = "@constant" })
	vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.python", { link = "@constant" })
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	event = "BufRead",
	build = ":TSUpdate",
	branch = "main",
	---@class TSConfig
	opts = {
		-- Other plugins can pass in desired filetype/parser combos.
		-- ensure_installed = { filetype = "parser1", filetype2 = "parser2" },
		ensure_installed = {},
	},
	config = function(_, opts)
		register(opts.ensure_installed)
		install_and_start()
		-- fix_python_highlight()
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
}
