return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	config = function()
		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { noremap = true, silent = true, desc = desc })
		end

		local barbar = require("barbar")
		barbar.setup({
			exclude_ft = {},
			exclude_name = {},
			icons = {
				buffer_index = true,
				buffer_number = false,
				button = "",
				modified = { button = "●" },
				pinned = { button = "󰐃", filename = true },
				preset = "default", -- ["default","powerline","slanted"]
			},
			sidebar_filetypes = {
				undotree = {
					text = "Undotree",
					align = "center",
				},
				-- trouble = {
				--     text = "Trouble",
				--     align = "center",
				-- },
			},
		})

		map({ "n" }, "<leader>bp", "<cmd>BufferPin<cr>", "Barbar: Toggle buffer pin")
		map({ "n" }, "<leader>bP", "<cmd>BufferPick<cr>", "Barbar: Pick buffer in current tab")
		map({ "n" }, "<leader>br", "<cmd>BufferRestore<cr>", "Barbar: Restore buffer")
		map({ "n" }, "<leader>b[", "<cmd>BufferMovePrevious<cr>", "Barbar: Shift buffer position (-1)")
		map({ "n" }, "<leader>b]", "<cmd>BufferMoveNext<cr>", "Barbar: Shift buffer position (+1)")

		-- vim.api.nvim_create_autocmd("ColorScheme", {
		--     pattern = "*",
		--     callback = function()
		--         vim.api.nvim_set_hl(0, "BufferDefaultTagpageFill", { bg = "none", })
		--         vim.api.nvim_set_hl(0, "BufferDefaultInactive", { bg = "none", })
		--         vim.api.nvim_set_hl(0, "BufferDefaultInactiveSign", { bg = "none", })
		--     end,
		-- })
		-- vim.cmd("hi BufferDefaultInactiveSign guibg=none")
		-- vim.cmd("hi BufferDefaultInactive guibg=none")
		-- vim.cmd("hi BufferDefaultTagpageFill guibg=none")
	end,
}
