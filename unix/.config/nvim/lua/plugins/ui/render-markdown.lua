return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	event = "VeryLazy",
	config = function()
		require("render-markdown").setup({
			file_types = {
				"markdown",
				"vimwiki",
				"Avante", -- Support Avante plugin
			},
			ft = {
				"markdown",
				"Avante", -- Support Avante plugin
			},
			render_modes = {
				"n", -- Normal mode
				"c", -- Command mode
			},
			quote = {
				repeat_linebreak = true,
			},
			win_options = {
				-- Help linebreaking for long quote
				showbreak = { default = "", rendered = "  " },
				breakindent = { default = false, rendered = true },
				breakindentopt = { default = "", rendered = "" },
			},
			indent = {
				enabled = true,
				-- per_level = 2,
				skip_level = 0,
				-- skip_heading = false,
			},
			checkbox = {
				position = "inline", -- ["inline", "overlay"]
				unchecked = {
					icon = " ",
					highlight = "RenderMarkdownUnchecked",
					scope_highlight = nil,
				},
				checked = {
					icon = " ",
					highlight = "RenderMarkdownChecked",
					scope_highlight = "@markup.strikethrough",
				},
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
					important = { raw = "[~]", rendered = "󰓎 ", highlight = "DiagnosticWarn" },
				},
			},
			heading = {
				position = "overlay", -- ["overlay", "inline"]
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				signs = { "󰫎 " },
				width = "full", -- ["full", "block"]
				left_margin = 0,
				left_pad = 0,
				right_pad = 0,
				min_width = 0,
				border = false,
				border_virtual = false,
				border_prefix = false,
				above = "▄",
				below = "▀",
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
				foregrounds = {
					"RenderMarkdownH1",
					"RenderMarkdownH2",
					"RenderMarkdownH3",
					"RenderMarkdownH4",
					"RenderMarkdownH5",
					"RenderMarkdownH6",
				},
			},
			link = {
				highlight = "RenderMarkdownLink",
				custom = {
					github = { pattern = "http[s]?://github.*", icon = "󰊤 ", highlight = "RenderMarkdownLink" },
					brew = {
						pattern = "http[s]?://formulae.brew.sh.*",
						icon = " ",
						highlight = "RenderMarkdownLink",
					},
					web = { pattern = "^http[s]?://", icon = "󰖟 ", highlight = "RenderMarkdownLink" },
					python = { pattern = "%.py$", icon = "󰌠 ", highlight = "RenderMarkdownLink" },
					java = { pattern = "%.java$", icon = " ", highlight = "RenderMarkdownLink" },
					javascript = { pattern = "%.js*$", icon = "󰌞 ", highlight = "RenderMarkdownLink" },
					shell = { pattern = "%.sh$", icon = " ", highlight = "RenderMarkdownLink" },
					go = { pattern = "%.go$", icon = " ", highlight = "RenderMarkdownLink" },
					rust = { pattern = "%.rs$", icon = "󱘗 ", highlight = "RenderMarkdownLink" },
					c_sharp = { pattern = "%.cs$", icon = " ", highlight = "RenderMarkdownLink" },
					c = { pattern = "%.c$", icon = "󰙱 ", highlight = "RenderMarkdownLink" },
					markdown = { pattern = "%.md$", icon = "󰍔 ", highlight = "RenderMarkdownLink" },
					typescript = { pattern = "%.ts*$", icon = "󰛦 ", highlight = "RenderMarkdownLink" },
					-- example = { pattern = "%.example$", icon = "󰛺 ", highlight = "RenderMarkdownLink" },
				},
			},
			bullet = {
				icons = { "●", "○", "", "", "◆", "◇" },
				left_pad = 4,
				highlight = "RenderMarkdownBullet",
			},
			pipe_table = {
				preset = "round", -- ["round", "double", "heavy"]
				style = "full",
				cell = "padded", -- ["padded", "trimmed", "raw", "overlay"]
				border = {
					"┌",
					"┬",
					"┐",
					"├",
					"┼",
					"┤",
					"└",
					"┴",
					"┘",
					"│",
					"─",
				},
				alignment_indicator = "━",
				head = "RenderMarkdownTableHead",
				row = "RenderMarkdownTableRow",
				filler = "RenderMarkdownTableFill",
			},
		})

		vim.keymap.set(
			"n",
			"<leader>m",
			"<cmd>RenderMarkdown toggle<cr>",
			{ silent = true, desc = "Markdown: Toggle render" }
		)
	end,
}
