-- ref: https://github.com/williamboman/mason.nvim
-- ref: https://github.com/williamboman/mason-lspconfig.nvim
-- credit: https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/lsp/mason.lua
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_dap = require("mason-nvim-dap")

		-- Enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Make sure to adjust `lsp.lua servers` to add opts for each
		-- of the installed servers
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				-- "pyright",
				-- "pylsp",
				"ty",
				"basedpyright",
				"tombi",
				"rust_analyzer",
				"dockerls",
				"docker_compose_language_service",
				"gopls",
				"golangci_lint_ls",
				"svelte",
				"ts_ls",
				"html",
				"htmx",
				"cssls",
				"tailwindcss",
				"eslint",
				"astro",
				"vuels",
				"graphql",
				"csharp_ls",
				"clangd",
				"jsonls",
				"yamlls",
				"pbls",
				-- "lemminx",
				-- "ansiblels",
				"bashls",
				-- "asm_lsp",
				"marksman",
				-- "remark_ls",
				"ltex",
				"powershell_es",
				"solc",
				"sqls",
				"vimls",
				"zls",
			},
			-- automatic_enable = {
			-- 	exclude = {
			-- 	},
			-- },
		})

		-- Make sure to adjust `none-ls.lua setup` to add opts for each
		-- of the installed servers
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- Prettier formatter
				"stylua", -- Lua formatter
				-- "isort",    -- Python formatter
				-- "black",    -- Python formatter
				-- "pylint",   -- Python formatter
				"ruff", -- Python LSP, linter & formatter
				"eslint_d", -- Javascript linter
				"shellharden", -- Bash linter & formatter
				"vacuum", -- OpenAPI linter
				-- https://docs.rockylinux.org/books/nvchad/vale_nvchad/#configuring-and-initializing-vale
				"vale", -- English linter
				"gofumpt", -- Go formatter
			},
		})

		mason_dap.setup({
			ensure_installed = {
				"js",
			},
			-- handlers {
			--     function(config)
			--         -- All sources with no handlers are passed here
			--
			--         mason_dap.default_setup(config)
			--     end,
			-- },
		})
	end,
}
