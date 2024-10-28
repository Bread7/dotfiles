---@diagnostic disable: duplicate-index
return {
	"saghen/blink.cmp",
    enabled = false,
	version = "v0.*",
	lazy = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		highlight = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = true,
		},
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
		keymap = {
			show = "<C-space>",
			hide = "<C-e>",
			accept = "<Tab>",
			select_prev = { "<Up>", "<C-p>" },
			select_next = { "<Down>", "<C-n>" },

			show_documentation = "<C-space>",
			hide_documentation = "<C-space>",
			scroll_documentation_up = "<C-b>",
			scroll_documentation_down = "<C-f>",

			snippet_forward = "<Tab>",
			snippet_backward = "<S-Tab>",
		},
		sources = {
			-- similar to nvim-cmp's sources, but we point directly to the source's lua module
			-- multiple groups can be provided, where it'll fallback to the next group if the previous
			-- returns no completion items
			-- WARN: This API will have breaking changes during the beta
			providers = {
				{
					{ "blink.cmp.sources.lsp" },
					{ "blink.cmp.sources.path" },
					{ "blink.cmp.sources.snippets", score_offset = -3 },
				},
				{ { "blink.cmp.sources.buffer" } },
			},
			-- FOR REF: full example
			providers = {
				{
					-- all of these properties work on every source
					{
						"blink.cmp.sources.lsp",
						keyword_length = 0,
						score_offset = 0,
						trigger_characters = { "f", "o", "o" },
						opts = {},
					},
					-- the follow two sources have additional options
					{
						"blink.cmp.sources.path",
						opts = {
							trailing_slash = false,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
							end,
							show_hidden_files_by_default = true,
						},
					},
					{
						"blink.cmp.sources.snippets",
						score_offset = -3,
						-- similar to https://github.com/garymjr/nvim-snippets
						opts = {
							friendly_snippets = true,
							search_paths = { vim.fn.stdpath("config") .. "/snippets" },
							global_snippets = { "all" },
							extended_filetypes = {},
							ignored_filetypes = {},
						},
					},
				},
				{ { "blink.cmp.sources.buffer" } },
			},
		},

		-- experimental auto-brackets support
		-- accept = { auto_brackets = { enabled = true } }

		-- experimental signature help support
		-- trigger = { signature_help = { enabled = true } }
	},

}
