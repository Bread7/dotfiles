-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
return {
	"rcarriga/nvim-dap-ui",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_virt_text = require("nvim-dap-virtual-text")
		local dap_go = require("dap-go")
		local registry = require("mason-registry")

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

		dapui.setup({})

		dap_virt_text.setup({
			-- Only available after nvim v0.10
			virt_text_pos = "inline",
			-- vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
		})
		dap_go.setup({})

		-- DAP configs
		-- Mason path: https://github.com/williamboman/mason.nvim/discussions/33
		-- Installations: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		-- https://github.com/PlatyPew/neovim-init.lua/blob/master/lua/plugins/dap.lua
		-- https://github.com/vishal340/new_nvim/blob/fda776e6341d84d77b6dedb03ba31bdba853a54b/lua/plugins/dap.lua#L154
		-- dap.adapters["pwa-node"] = {
		-- 	type = "server",
		-- 	host = "localhost",
		-- 	port = "${port}",
		-- 	executable = {
		-- 		command = "node",
		-- 		-- 💀 Make sure to update this path to point to your installation
		-- 		args = {
		-- 			registry.get_package("js-debug-adapter"):get_install_path(),
		-- 			"${port}",
		-- 		},
		-- 	},
		-- }

		-- Debugger based on project's dependencies
		-- https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
		require("dap-python").setup("uv")
		require("dap-python").test_runner = "pytest"
		dap.configurations.python = {
			type = "python",
			request = "launch",
			name = "Python DAP",
			program = "${file}", -- Launch current file if used
			-- django = true,
			jinja = true,
			console = "integratedTerminal",
		}

		-- DAP keymaps
		map({ "n" }, "<leader>dt", dap.toggle_breakpoint, "DAP: Toggle breakpoint")
		map({ "n" }, "<leader>dc", dap.continue, "DAP: Continue next process")
		map({ "n" }, "<leader>dc", dap.continue, "DAP: Continue next process")
		map({ "n" }, "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", "DAP-UI: Toggle UI")
		map({ "n" }, "<leader>?", function()
			require("dapui").eval(nil, { enter = true })
		end, "DAP: Eval var under cursor")

		-- Events to handle windows for UI
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
