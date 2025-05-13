-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#yamlls
return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.gitlab" },
	handlers = {
		["yaml/schema/store/initialized"] = function(...)
			require("schema-companion.lsp").store_initialized(...)
		end,
	},
	on_attach = function(client, bufnr)
		require("schema-companion.context").setup(bufnr, client)
		keys.bmap("<leader>vs", function()
			local schema = require("schema-companion.context").get_buffer_schema(bufnr)

			if schema and schema.name then
				notify.info(schema.name)
			end
		end, "Show YAML schema", bufnr)
	end,
	on_init = function(client)
		client:notify("yaml/supportSchemaSelection", { {} })
	end,
	on_new_config = function(config)
		config.settings = vim.tbl_deep_extend("force", config.settings, {
			yaml = { schemas = require("schemastore").yaml.schemas() },
		})
	end,
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			format = {
				enable = true,
				singleQuote = false,
			},
			editor = {
				formatOnType = false,
			},
			hover = true,
			schemas = {
				-- GitHub CI workflows
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			validate = true,
		},
	},
}
