return {
	"kosayoda/nvim-lightbulb",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lightbulb = require("nvim-lightbulb")
		lightbulb.setup({
			priority = 10,
			hide_in_unfocused_buffer = false,
			link_highlights = true,
			sign = {
				enabled = false,
				text = "💡",
				-- Highlight group to highlight the sign column text.
				hl = "LightBulbSign",
			},
			virtual_text = {
				enabled = true,
				-- Text to show in the virt_text.
				text = "💡",
				-- Position of virtual text given to |nvim_buf_set_extmark|.
				-- Can be a number representing a fixed column (see `virt_text_pos`).
				-- Can be a string representing a position (see `virt_text_win_col`).
				pos = "eol",
				hl = "LightBulbVirtualText",
				-- How to combine other highlights with text highlight.
				-- See `hl_mode` of |nvim_buf_set_extmark|.
				hl_mode = "combine",
			},
            float = {
                enabled = false,
            },
            status_text = {
                enabled = false,
                text = "💡",
                text_unavailable = "",
            },
            number = {
                enabled = false,
                hl = "LightBulbNumber",
            },
            line = {
                enabled = false,
                hl = "LightBulbLine",
            },
			autocmd = {
                enabled = true
            },
            ignore = {
                ft = {
                    "Avante",
                    "Alpha",
                    "Dashboard",
                }
            }
		})
	end,
}