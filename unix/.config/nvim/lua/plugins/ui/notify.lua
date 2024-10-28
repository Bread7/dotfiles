return {
	"rcarriga/nvim-notify",
	dependencies = {
		{
			"mrded/nvim-lsp-notify",
			commit = "9541bdd",
			requires = { "rcarriga/nvim-notify" },
			config = function()
				require("lsp-notify").setup({
					notify = require("notify"),
				})
			end,
		},
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
			config = function()
				require("noice").setup({
					lsp = {
						-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
						},
					},
					-- you can enable a preset for easier configuration
					presets = {
						bottom_search = true, -- use a classic bottom cmdline for search
						command_palette = true, -- position the cmdline and popupmenu together
						long_message_to_split = true, -- long messages will be sent to a split
						inc_rename = false, -- enables an input dialog for inc-rename.nvim
						lsp_doc_border = false, -- add a border to hover docs and signature help
					},
				})
			end,
		},
	},
	lazy = false,
	config = function()
		require("notify").setup({
			background_colour = "NotifyBackground",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "fade",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 1000,
			top_down = true,
		})

		-- Set default global
		vim.notify = require("notify")

		-- Use `:Notifications` to display a log of the history
		local opts = { silent = true, noremap = true }
		opts.desc = "Notify: Show notification history"
		vim.keymap.set("n", "<leader>n", "<cmd>Notifications<CR>", opts)
		-- vim.keymap.set("", "<Esc>", "<ESC>:noh<CR>:require('notify').dismiss()<CR>",
		--     { silent = true, desc = "Notify: Remove notifications"})
		-- vim.keymap.set("", "<esc>", "<cmd>noh<cr>", { silent = true, desc = "Notify: Remove contifications" })

		-- table from lsp severity to vim severity.
		local severity = {
			"error",
			"warn",
			"info",
			"info", -- map both hint and info to info?
		}
		vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
		             vim.notify(method.message, severity[params.type])
		end
	end,
}
