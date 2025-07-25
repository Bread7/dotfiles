return {
	"rmagatti/auto-session",
	lazy = false,
	-- enabled = false,
	config = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"
		local session = require("auto-session")
		session.setup({
			enabled = false,
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			use_git_branch = true, -- Include git branch name in session name
			bypass_save_filetypes = { "alpha", "dashboard" },
			auto_restore_last_session = false,
			post_cwd_changed_cmds = {
				function()
					-- require("lualine").refresh()
				end,
			},
			pre_save_cmds = {
				-- Integration with barbar
				function()
					vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
				end,
			},
		})

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

		map({ "n" }, "<leader>ss", "<cmd>Autosession search<cr>", "Session: Search")
		map({ "n" }, "<leader>sS", "<cmd>SessionSave<cr>", "Session: Save")
		map({ "n" }, "<leader>sd", "<cmd>Autosession delete<cr>", "Session: Delete")
		map({ "n" }, "<leader>sr", "<cmd>SessionRestore<cr>", "Session: Restore")
		map({ "n" }, "<leader>st", "<cmd>SessionToggleAutoSave<cr>", "Session: Toggle autosave")
		map({ "n" }, "<leader>sp", "<cmd>SessionPurgeOrphaned<cr>", "Session: Removes all orphaned session")
	end,
}
