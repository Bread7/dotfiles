return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			-- table: default groups
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- table: additional groups that should be cleared
			extra_groups = {
				"NormalFloat",
				"TabLineFill",
			},
			-- table: groups you don't want to clear
			exclude_groups = {},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			-- on_clear = function() end,
		})

		-- Use this to clear plugin's highlight group dynamically
		-- `lua require("transparent").clear_prefix("<plugin name>")`
		-- local transparent = require("transparent")
		-- transparent.clear_prefix("<plugin name>")

		-- vim.cmd("TransparentEnable")
	end,
}
