return {
	"ibhagwan/fzf-lua",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",

		-- Terminal based dependencies
		-- fzf, fd, rg, bat, delta, nvim-dap
	},
	config = function()
		-- Set FzfLua as UI
		vim.cmd("FzfLua register_ui_select")

		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			-- { "fzf-native", },
			-- { "telescope", "fzf-native", },
			winopts = {
				-- hl = {
				-- 	border = "FloatBorder",
				-- },
				backdrop = 100,
			},
			hls = {
				border = "FloatBorder",
			},
			preview = {
				-- border = "noborder",
				flip_columns = 90,
			},
			keymap = {
				-- Below are the default binds, setting any value in these tables will override
				-- the defaults, to inherit from the defaults change [1] from `false` to `true`
				builtin = {
					-- neovim `:tmap` mappings for the fzf win
					-- true,        -- uncomment to inherit all the below in your custom config
					["<M-Esc>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
					["<F1>"] = "toggle-help",
					["<F2>"] = "toggle-fullscreen",
					-- Only valid with the 'builtin' previewer
					["<F3>"] = "toggle-preview-wrap",
					["<F4>"] = "toggle-preview",
					-- Rotate preview clockwise/counter-clockwise
					["<F5>"] = "toggle-preview-ccw",
					["<F6>"] = "toggle-preview-cw",
					-- `ts-ctx` binds require `nvim-treesitter-context`
					["<F7>"] = "toggle-preview-ts-ctx",
					["<F8>"] = "preview-ts-ctx-dec",
					["<F9>"] = "preview-ts-ctx-inc",
					["<S-Left>"] = "preview-reset",
					["<S-down>"] = "preview-page-down",
					["<S-up>"] = "preview-page-up",
					["<M-S-down>"] = "preview-down",
					["<M-S-up>"] = "preview-up",
				},
				fzf = {
					-- fzf '--bind=' options
					-- true,        -- uncomment to inherit all the below in your custom config
					["ctrl-z"] = "abort",
					["ctrl-u"] = "unix-line-discard",
					["ctrl-f"] = "half-page-down",
					["ctrl-b"] = "half-page-up",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["alt-a"] = "toggle-all",
					["alt-g"] = "first",
					["alt-G"] = "last",
					-- Only valid with fzf previewers (bat/cat/git/etc)
					["f3"] = "toggle-preview-wrap",
					["f4"] = "toggle-preview",
					["shift-down"] = "preview-page-down",
					["shift-up"] = "preview-page-up",
				},
			},
			actions = {
				-- Below are the default actions, setting any value in these tables will override
				-- the defaults, to inherit from the defaults change [1] from `false` to `true`
				files = {
					-- true,        -- uncomment to inherit all the below in your custom config
					-- Pickers inheriting these actions:
					--   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
					--   tags, btags, args, buffers, tabs, lines, blines
					-- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
					-- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
					-- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
					["enter"] = actions.file_edit_or_qf,
					["ctrl-s"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
					["ctrl-t"] = actions.file_tabedit,
					["ctrl-q"] = actions.file_sel_to_qf,
					["ctrl-Q"] = actions.file_sel_to_ll,
					["ctrl-i"] = actions.toggle_ignore,
					["ctrl-h"] = actions.toggle_hidden,
					["ctrl-f"] = actions.toggle_follow,
				},
			},
			previewers = {
				bat = {
					cmd = "bat",
					args = "--color=always --decorations=always --style=full --wrap=never",
					theme = "Catppuccin Mocha",
				},
			},
			files = {
				previewer = "bat",
				fd_opts = [[--color never --type f --hidden --follow --strip-cwd-prefix]],
				actions = {
					["default"] = actions.file_edit,
					["ctrl-q"] = actions.file_sel_to_qf,
				},
			},
			lsp = {
				async_or_timeout = false,
				severity = "Warning",
				icons = {
					-- ['Error'] = { icon = vim.g.diagnostic_icons.Error, color = 'red' },
					-- ['Warning'] = { icon = vim.g.diagnostic_icons.Warning, color = 'yellow' },
					-- ['Information'] = { icon = vim.g.diagnostic_icons.Information, color = 'blue' },
					-- ['Hint'] = { icon = vim.g.diagnostic_icons.Hint, color = 'blue' },
				},
				actions = {
					["default"] = actions.file_edit_or_qf,
					["ctrl-q"] = actions.file_sel_to_qf,
				},
			},
			keymaps = {
				show_details = false,
				winopts = {
					preview = {
						layout = "vertical",
					},
				},
			},
		})

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

		map({ "i" }, "<C-x><C-f>", function()
			require("fzf-lua").complete_file({
				cmd = "rg --files",
				winopts = { preview = { hidden = "nohidden" } },
			})
		end, "Fuzzy complete file")

		map("n", "<leader>fh", "<cmd>FzfLua search_history<CR>", "Fuzzy search history")
		map("n", "<leader>fH", "<cmd>FzfLua command_history<CR>", "Fuzzy command history")
		map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", "Fuzzy buffers in current tab")
		map("n", "<leader>ff", "<cmd>FzfLua files<CR>", "Fuzzy files in current directory")
		map("n", "<leader>fg", "<cmd>FzfLua grep<CR>", "Fuzzy grep")
		map("n", "<leader>fgS", "<cmd>FzfLua git_stash<CR>", "Fuzzy git stashes in current repo")
		map("n", "<leader>fgb", "<cmd>FzfLua git_branches<CR>", "Fuzzy all git branches (local & remote)")
		map("n", "<leader>fgc", "<cmd>FzfLua git_commits<CR>", "Fuzzy all git commits")
		map("n", "<leader>fgf", "<cmd>FzfLua git_files<CR>", "Fuzzy all files for any git status")
		map("n", "<leader>fgs", "<cmd>FzfLua git_status<CR>", "Fuzzy all git status changes in current repo")
		map("n", "<leader>fgt", "<cmd>FzfLua git_tags<CR>", "Fuzzy all git tags in current repo")
		-- map("n", "<leader>fgv", "<cmd>FzfLua grep_visual<CR>", "Fuzzy grep in visual mode")
		map("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", "Fuzzy all keymaps")
		-- map("n", "<leader>flg", "<cmd>FzfLua live_grep<CR>", "Fuzzy live grep by passing args")
		map("n", "<leader>ft", "<cmd>FzfLua tags<CR>", "Fuzzy tagged files")
		-- map("n", "<leader>ftg", "<cmd>FzfLua tags_grep<CR>", "Fuzzy tagged files with grep")
		map("n", "<leader>fw", "<cmd>FzfLua tabs<CR>", "Fuzzy tabs in current neovim process")
		map("n", "<leader>fr", [[<cmd>lua require("fzf-lua").registers()<CR>]], "Fuzzy all registers")
	end,
}
