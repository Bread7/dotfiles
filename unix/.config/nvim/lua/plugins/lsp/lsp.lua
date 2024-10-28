-- ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- ref: https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/lsp.lua#L285
return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		"williamboman/mason.nvim", -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"ibhagwan/fzf-lua",

		-- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

		-- ref: https://github.com/neovim/neovim/issues/23526
		vim.diagnostic.config({
			virtual_text = false,
		})

		local ns = vim.api.nvim_create_namespace("CurlineDiag")
		vim.opt.updatetime = 100
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("BreadLspConfig", { clear = true }),
			callback = function(event)
				-- Require fzflua
				--  To jump back, press <C-t>.
				map("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", "LSP: Go to definitions")
				map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", "LSP: Go to declarations")
				map("n", "gdd", "<cmd>FzfLua lsp_document_diagnostics<CR>", "LSP: Go to document diagnostics")
				map("n", "gds", "<cmd>FzfLua lsp_document_symbols<CR>", "LSP: Go to document symbols")
				map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", "LSP: Go to implementations")
				map("n", "gr", "<cmd>FzfLua lsp_references<CR>", "LSP: Go to references")
				map("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", "LSP: Go to type definitions")
				map("n", "gwd", "<cmd>FzfLua lsp_workspace_diagnostics<CR>", "LSP: Go to workspace diagnostics")
				map("n", "gws", "<cmd>FzfLua lsp_workspace_symbols<CR>", "LSP: Go to workspace symbols")
				map("n", "gca", "<cmd>FzfLua lsp_code_actions<CR>", "LSP: Code actions")
				map("n", "gf", "<cmd>lua vim.lsp.buf.format()<CR>", "LSP: Format entire file")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("bread-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("bread-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "bread-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- The following code creates a keymap to toggle inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				-- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
				map({ "n" }, "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, "[T]oggle Inlay [H]ints")

				-- ref: https://github.com/neovim/neovim/issues/23526
				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = event.buf,
					callback = function()
						pcall(vim.api.nvim_buf_clear_namespace, event.buf, ns, 0, -1)
						local hi = { "Error", "Warn", "Info", "Hint" }
						local curline = vim.api.nvim_win_get_cursor(0)[1]
						local diagnostics = vim.diagnostic.get(event.buf, { lnum = curline - 1 })
						local virt_texts = { { (" "):rep(4) } }
						for _, diag in ipairs(diagnostics) do
							virt_texts[#virt_texts + 1] = { diag.message, "Diagnostic" .. hi[diag.severity] }
						end
						vim.api.nvim_buf_set_extmark(event.buf, ns, curline - 1, 0, {
							virt_text = virt_texts,
							hl_mode = "combine",
						})
					end,
				})
			end,
		})

		-- Enable autocompletion (assign to every lsp server config)
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		local spell_words = {}
		for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8-GB.add", "r"):lines() do
			table.insert(spell_words, word)
		end
		local servers = {
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							mccabe = { enabled = false },
							pylsp_mypy = { enabled = false },
							pylsp_black = { enabled = false },
							pylsp_isort = { enabled = false },
						},
					},
				},
			},
			basedpyright = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
				},
			},
			ts_ls = {},
			ruff = {},
			html = { filetypes = { "html", "twig", "hbs", "templ" } },
			cssls = {},
			-- tailwindcss = {},
			dockerls = {
				settings = {
					docker = {
						languageserver = {
							formatter = {
								ignoreMultilineInstructions = true,
							},
						},
					},
				},
			},
			docker_compose_language_service = {
				filetypes = { "yaml.docker-compose" },
			},
			sqlls = {},
			jsonls = {},
			yamlls = {
				filetypes = { "yaml", "yaml.gitlab" },
				settings = {
					redhat = {
						telemetry = {
							enabled = false,
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
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
			},
			marksman = {},
			ltex = {
				settings = {
					ltex = {
						language = "en-GB",
						enabled = true,
						dictionary = {
							["en-GB"] = spell_words,
						},
					},
				},
			},
			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
					},
				},
			},
			golangci_list_ls = {},
			htmx = {},
			-- remark_ls = {
			-- 	settings = {
			-- 		-- requireConfig = true,
			-- 	},
			-- },
		}

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local server = servers[server_name] or {}
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for ts_ls)
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		})
		-- Keymaps
		map("n", "K", vim.lsp.buf.hover, "LSP: Display symbol information under cursor")
	end,
}
