return {
	"kevinhwang91/nvim-ufo",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.o.foldcolumn = "1" -- '1' to show arrows and '0' to hide arrows
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		local ufo = require("ufo")
		ufo.setup({
			-- Using treesitter as provider
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,

			fold_virt_text_handler = handler,
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					-- winhighlight = "Normal:Folded,Normal:UfoPreviewNormal,FloatBorder:UfoPreviewBorder,CursorLine:UfoPreviewCursorLine",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
		})

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

		map({ "n" }, "zR", ufo.openAllFolds, "UFO: Open all folds")
		map({ "n" }, "zM", ufo.closeAllFolds, "UFO: Close all folds")
		map({ "n" }, "zr", ufo.openFoldsExceptKinds, "UFO: Open specific folds")
		map({ "n" }, "zm", ufo.closeFoldsWith, "UFO: Close folds with specific index")
		map({ "n" }, "K", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
				-- vim.cmd([[ Lspsaga hover_doc ]])
			end
		end, "UFO/LSP: Peek at folded lines / Hover info")
	end,
}
