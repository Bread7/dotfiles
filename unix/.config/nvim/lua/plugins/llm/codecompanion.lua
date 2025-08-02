return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "nvim-treesitter/nvim-treesitter-textobjects",
			"ravitemer/mcphub.nvim",
		},
		config = function(_, opts)
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { silent = true, desc = desc })
			end

			require("codecompanion").setup({
				adapters = {
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
							env = {
								api_key = "cmd: grep '^ANTHROPIC_API_KEY=' $HOME/.config/nvim/.env | cut -d '=' -f2-",
							},
							schema = {
								model = {
									default = "claude-3-7-sonnet-latest",
								},
							},
						})
					end,
					openai = function()
						return require("codecompanion.adapters").extend("openai", {
							env = {
								api_key = "cmd: grep '^OPENAI_API_KEY=' $HOME/.config/nvim/.env | cut -d '=' -f2-",
							},
							schema = {
								model = {
									default = "gpt-4.1-mini",
								},
							},
						})
					end,
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "cmd: grep '^GEMINI_API_KEY=' $HOME/.config/nvim/.env | cut -d '=' -f2-",
							},
							schema = {
								model = {
									default = "gemini-2.5-flash",
								},
							},
						})
					end,
					llama_cpp = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "http://127.0.0.1:8080",
								chat_url = "/v1/chat/completions",
								models_endpoint = "/v1/models",
							},
						})
					end,
				},
				strategies = {
					chat = {
						adapter = "gemini",
						model = "gemini-2.5-flash",
						keymaps = {
							close = {
								modes = { n = "<space>cC", i = "<space>cC" },
								opts = {},
							},
						},
						tools = {
							opts = {
								auto_submit_errors = true, -- Send any errors to the LLM automatically
								auto_submit_success = true, -- Send any successful output to the LLM automatically
							},
						},
					},
					inline = {
						adapter = "gemini",
						model = "gemini-2.5-flash",
					},
					cmd = {
						adapter = "gemini",
						model = "gemini-2.5-flash",
					},
				},
				display = {
					diff = { enabled = false },
					chat = {
						show_header_separator = false,
						show_settings = false, -- do not show settings to allow model change with shortcut
					},
					action_palette = { provider = "default" },
				},
				extensions = {
					mcphub = {
						callback = "mcphub.extensions.codecompanion",
						opts = {
							-- MCP Tools
							make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
							show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
							add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
							show_result_in_chat = true, -- Show tool results directly in chat buffer
							format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
							-- MCP Resources
							make_vars = true, -- Convert MCP resources to #variables for prompts
							-- MCP Prompts
							make_slash_commands = true, -- Add MCP prompts as /slash commands
						},
					},
				},
			})

			map({ "n", "v" }, "<leader>;", "<cmd>CodeCompanionActions<cr>", "CodeCompanion: Toggle Action Palette")
			map({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", "CodeCompanion: Toggle Chat")
			map({ "v" }, "<leader>ca", "<cmd>CodeCompanionChat Add<cr>", "CodeCompanion: Add text to Chat")
			map({ "n", "v" }, "<leader>ci", "<cmd>CodeCompanion<cr>", "CodeCompanion: Inline Prompt")
			vim.cmd([[cab cc CodeCompanion]])

			require("plugins.llm.utils.spin")
			-- Not working
			-- require("plugins.llm.utils.extmarks").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = function(_, opts)
			vim.treesitter.language.register("markdown", "codecompanion")
			return opts
		end,
	},
}
