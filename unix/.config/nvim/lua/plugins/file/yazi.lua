return {
	"mikavilpas/yazi.nvim",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{
			"<leader>-",
			"<cmd>Yazi<cr>",
			desc = "Yazi: Open at current file",
		},
		{
			"<leader>.",
			"<cmd>Yazi cwd<cr>",
			desc = "Yazi: Open in working directory",
		},
		{
			"<M-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Yazi: Resume last session",
		},
	},
	opts = {
		highlight_groups = {
			-- See https://github.com/mikavilpas/yazi.nvim/pull/180
			hovered_buffer = nil,
			-- See https://github.com/mikavilpas/yazi.nvim/pull/351
			hovered_buffer_in_same_directory = nil,
		},
		hooks = {
			on_yazi_ready = function(_, _, process_api)
				io.write("hello")
			end,
		},
		yazi_floating_window_winblend = 25,
	},
}
