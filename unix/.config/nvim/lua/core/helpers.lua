-- Custom code utils for different purposes

local M = {}

-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Appearance of diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		-- Add a custom format function to show error codes
		format = function(diagnostic)
			local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
			return string.format("%s %s", code, diagnostic.message)
		end,
	},
	underline = false,
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
	-- Make diagnostic background transparent
	on_ready = function()
		vim.cmd("highlight DiagnosticVirtualText guibg=NONE")
	end,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Close float windows
-- function Util.close_float()
-- 	for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 		if vim.api.nvim_win_get_config(win).relative == "win" then
-- 			vim.api.nvim_win_close(win, false)
-- 		end
-- 	end
-- end
-- local SPECIAL_FLOAT_FTS = {
-- 	"hydra_hint",
-- 	"which-key",
-- 	"zenmode-bg",
-- 	"TelescopePrompt",
-- 	"TelescopeResults",
-- }
-- -- Close floating windows
-- -- Source: https://www.reddit.com/r/neovim/comments/1335pfc/comment/jiaagyi
-- function M.close_floats()
-- 	local needs_hack = false
-- 	local inactive_floating_wins = vim.fn.filter(vim.api.nvim_list_wins(), function(_, v)
-- 		local file_type = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(v), "filetype")
-- 		if file_type == "noice" then
-- 			needs_hack = true
-- 		end
--
-- 		return vim.api.nvim_win_get_config(v).relative ~= ""
-- 			and v ~= vim.api.nvim_get_current_win()
-- 			and not vim.tbl_contains(SPECIAL_FLOAT_FTS, file_type)
-- 	end)
-- 	-- If we're closing a noice float, we need to employ a hack
-- 	-- to prevent the float to reopen on the top left under some scenarios (e.g., when we reopen it witout moving our cursor)
-- 	vim.api.nvim_feedkeys("hl", "nt", true)
-- 	-- if needs_hack then
-- 	-- end
-- 	-- for _, w in ipairs(inactive_floating_wins) do
-- 	--   local file_type = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(w), "filetype")
-- 	--   local buftype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(w), "buftype")
-- 	--   require("ditsuke.utils").logger("Closing float: " .. file_type .. " (" .. buftype .. ")")
-- 	--   pcall(vim.api.nvim_win_close, w, false)
-- 	-- end
-- end

return M
