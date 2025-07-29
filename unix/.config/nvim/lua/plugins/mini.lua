return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.align").setup({
				-- mappings = {
				--     start = "ga",
				--     start_with_preview = "gA",
				-- },
				-- Modifiers changing alignment steps and/or options
				-- modifiers = {
				--     -- Main option modifiers
				--     ['s'] = --<function: enter split pattern>,
				--     ['j'] = --<function: choose justify side>,
				--     ['m'] = --<function: enter merge delimiter>,
				--
				--     -- Modifiers adding pre-steps
				--     ['f'] = --<function: filter parts by entering Lua expression>,
				--     ['i'] = --<function: ignore some split matches>,
				--     ['p'] = --<function: pair parts>,
				--     ['t'] = --<function: trim parts>,
				--
				--     -- Delete some last pre-step
				--     ['<BS>'] = --<function: delete some last pre-step>,
				--
				--     -- Special configurations for common splits
				--     ['='] = --<function: enhanced setup for '='>,
				--     [','] = --<function: enhanced setup for ','>,
				--     ['|'] = --<function: enhanced setup for '|'>,
				--     [' '] = --<function: enhanced setup for ' '>,
				-- },
			})

			require("mini.ai").setup({})

			-- require("mini.animate").setup({})
			--
			-- 			require("mini.bracketed").setup({
			-- 				-- First-level elements are tables describing behavior of a target:
			-- 				-- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
			-- 				--   For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
			-- 				--   Supply empty string `''` to not create mappings.
			-- 				--
			-- 				-- - <options> - table overriding target options.
			-- 				--
			-- 				-- See `:h MiniBracketed.config` for more info.

			-- 				buffer = { suffix = "b", options = {} },
			-- 				comment = { suffix = "c", options = {} },
			-- 				conflict = { suffix = "x", options = {} },
			-- 				diagnostic = { suffix = "d", options = {} },
			-- 				file = { suffix = "f", options = {} },
			-- 				indent = { suffix = "i", options = {} },
			-- 				jump = { suffix = "j", options = {} },
			-- 				location = { suffix = "l", options = {} },
			-- 				oldfile = { suffix = "o", options = {} },
			-- 				quickfix = { suffix = "q", options = {} },
			-- 				treesitter = { suffix = "t", options = {} },
			-- 				undo = { suffix = "u", options = {} },
			-- 				window = { suffix = "w", options = {} },
			-- 				yank = { suffix = "y", options = {} },
			-- 			})

			local map = require("mini.map")
			map.setup({
				integrations = {
					map.gen_integration.builtin_search(),
					map.gen_integration.diff(),
					map.gen_integration.diagnostic(),
				},
			})
			vim.keymap.set("n", "<leader>M", map.toggle, { silent = true, desc = "Mini.Map: Toggle map" })

			require("mini.move").setup({
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<C-S-h>",
					right = "<C-S-l>",
					down = "<C-S-j>",
					up = "<C-S-k>",

					-- Move current line in Normal mode
					line_left = "<C-S-h>",
					line_right = "<C-S-l>",
					line_down = "<C-S-j>",
					line_up = "<C-S-k>",
				},

				-- Options which control moving behavior
				options = {
					-- Automatically reindent selection during linewise vertical move
					reindent_linewise = true,
				},
			})

			require("mini.surround").setup({
				-- Add custom surroundings to be used on top of builtin ones. For more
				-- information with examples, see `:h MiniSurround.config`.
				custom_surroundings = nil,

				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},

				-- Number of lines within which surrounding is searched
				n_lines = 20,

				-- Whether to respect selection type:
				-- - Place surroundings on separate lines in linewise mode.
				-- - Place surroundings on each line in blockwise mode.
				respect_selection_type = false,

				-- How to search for surrounding (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
				-- see `:h MiniSurround.config`.
				search_method = "cover",

				-- Whether to disable showing non-error feedback
				silent = false,
			})

			require("mini.trailspace").setup({
				-- Highlight only in normal buffers (ones with empty 'buftype'). This is
				-- useful to not show trailing whitespace where it usually doesn't matter.
				only_in_normal_buffers = true,
			})
			vim.keymap.set(
				{ "n" },
				"<leader>tt",
				"<cmd>lua MiniTrailspace.trim()<cr>",
				{ silent = true, desc = "Mini.Trailspace: Trim current line" }
			)

			require("mini.bufremove").setup({})

			require("mini.comment").setup({
				options = {
					-- ignore_blank_line = true,
					-- start_of_line = true,
				},
			})

			require("mini.tabline").setup({})
		end,
	},
}
