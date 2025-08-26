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
		"igorlfs/nvim-dap-view",
		"stevearc/overseer.nvim",
	},
	config = function()
		local dap = require("dap")
		-- local dapui = require("dapui")
		local dapview = require("dap-view")
		local dap_virt_text = require("nvim-dap-virtual-text")
		local dap_go = require("dap-go")
		local registry = require("mason-registry")
		local overseer = require("overseer")

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

		-- Custom highlights
		vim.fn.sign_define("DapBreakpoint", {
			text = "󰐝 ",
			texthl = "DiagnosticSignInfo",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = " ", -- or "❌"
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapStopped", {
			text = " ", -- or "→"
			texthl = "DiagnosticSignWarn",
			linehl = "Visual",
			numhl = "DiagnosticSignWarn",
		})

		vim.fn.sign_define("DapLogPoint", {
			text = " ",
			texthl = "DiagnosticSignOk",
			linehl = "Visual",
			numhl = "DiagnosticSignOk",
		})

		vim.fn.sign_define("DapBreakpointCondition", {
			text = "󰈼 ",
			texthl = "DiagnosticInfo",
			linehl = "",
			numhl = "",
		})

		dapview.setup({
			winbar = {
				controls = {
					enabled = true,
				},
				sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
				default_section = "scopes",
			},
			windows = {
				terminal = {
					position = "left",
					start_hidden = true,
				},
			},
		})
		-- dapui.setup({})

		dap_virt_text.setup({
			-- Only available after nvim v0.10
			-- virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
			virt_text_pos = "eol",
			commented = true,
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

		-- DAP keymaps
		map({ "n" }, "<leader>dt", dap.toggle_breakpoint, "DAP: Toggle breakpoint")
		map({ "n" }, "<leader>dc", dap.continue, "DAP: Continue next process")
		map({ "n" }, "<leader>do", dap.step_over, "DAP: Step over next process")
		map({ "n" }, "<leader>di", dap.step_into, "DAP: Step into next process")
		map({ "n" }, "<leader>dO", dap.step_out, "DAP: Step out next process")
		map({ "n" }, "<leader>db", dap.step_back, "DAP: Step back previous process")
		map({ "n" }, "<leader>dB", dap.reverse_continue, "DAP: Time travel debugging")
		map({ "n" }, "<leader>dq", dap.terminate, "DAP: Terminate debugging")
		map({ "n" }, "<leader>du", dapview.toggle, "DAP-View: Toggle UI")
		map({ "n" }, "<leader>dw", dapview.add_expr, "DAP: Add cursor word into Watch")
		map({ "n" }, "<leader>de", require("dap.ui.widgets").hover, "DAP: Hover cursor value")
		-- map({ "n" }, "<leader>du", "<cmd>lua require('dap-view').toggle()<cr>", "DAP-UI: Toggle UI")
		-- map({ "n" }, "<leader>de", function()
		-- 	require("dapui").eval(nil, { enter = true })
		-- end, "DAP: Eval var under cursor")
		-- -- https://www.reddit.com/r/neovim/comments/1ge0al4/is_it_possible_to_add_variable_to_watch_list_at/
		-- map({ "n" }, "<leader>dw", require("dapui").elements.watches.add, "DAP: Add cursor word into Watch")

		-- Events to handle windows for UI
		dap.listeners.after.event_initialized["dapview_config"] = function()
			dapview.open()
		end
		-- dap.listeners.before.attach.dapui_config = function()
		-- 	dapui.open()
		-- end
		-- dap.listeners.before.launch.dapui_config = function()
		-- 	dapui.open()
		-- end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		-- 	dapui.close()
		-- end

		-- This is used to run preLaunchTask and postDebugTask for debuggers with .vscode/launch.json
		overseer.setup()
	end,
}
