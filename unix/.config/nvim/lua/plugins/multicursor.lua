return {
    "jake-stewart/multicursor.nvim",
    -- commit = "f9d1c8b",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local mc = require("multicursor-nvim")

        mc.setup()

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

        map({ "n", "v" }, "<leader>cj", function()
        mc.lineAddCursor(1) end, "Multicursor: Add cursor below main cursor")
        map({ "n", "v" }, "<leader>ck", function()
        mc.lineAddCursor(-1) end, "Multicursor: Add cursor above main cursor")
        map({ "n", "v" }, "<leader>cJ", function()
        mc.lineSkipCursor(1) end, "Multicursor: Skip cursor below main cursor")
        map({ "n", "v" }, "<leader>cK", function()
        mc.lineSkipCursor(-1) end, "Multicursor: Skip cursor above main cursor")

        map({ "n", "v" }, "<leader>cn", function()
        mc.matchAddCursor(1) end, "Multicursor: Add cursor on next matching word/selection")
        map({ "n", "v" }, "<leader>cN", function()
        mc.matchAddCursor(-1) end, "Multicursor: Add cursor on previous matching word/selection")
        map({ "n", "v" }, "<leader>cs", function()
        mc.matchSkipCursor(1) end, "Multicursor: Skip cursor on next matching word/selection")
        map({ "n", "v" }, "<leader>cS", function()
        mc.matchSkipCursor(-1) end, "Multicursor: Skip cursor on previours matching word/selection")

        map({ "n" }, "<leader>C", function()
            if not mc.cursorsEnabled() then
                mc.enableCursors()
            elseif mc.hasCursors() then
                mc.clearCursors()
            else
                -- Default <esc> handler
            end
        end, "Multicursor: Escape/clear all cursors")


        map({ "n", "v" }, "<leader>cA", mc.matchAllAddCursors, "Multicursor: Add cursors on all matches")
        map({ "n", "v" }, "<leader>c[", mc.prevCursor, "Multicursor: Rotate to previous cursor")
        map({ "n", "v" }, "<leader>c]", mc.nextCursor, "Multicursor: Rotate to next cursor")

        map({ "n", "v" }, "<leader>cx", mc.deleteCursor, "Multicursor: Delete current cursor")
        map({ "n" }, "<c-leftmouse>", mc.handleMouse, "Multicursor: Add/remove cursor with mouse click")

        map({ "n", "v" }, "<leader>ct", mc.toggleCursor, "Multicursor: Add/remove cursors via toggle")

        -- map({"n", "v"}, "<leader><c-q>", mc.duplicateCursors, "Multicursor: Clone every cursor and disable originals")

        map({ "n" }, "<leader>cr",  mc.restoreCursors, "Multicursor: Restore cleared cursors")

        map({ "v" }, "<leader>a", mc.alignCursors, "Multicursor: Align cursor columns")
        map({ "v" }, "S", mc.splitCursors, "Multicursor: Split visual selections by regex")
        map({ "v" }, "I", mc.insertVisual, "Multicursor: Insert for each line of visual selections")
        map({ "v" }, "A", mc.appendVisual, "Multicursor: Append for each line of visual selections")
        map({ "v" }, "M", mc.matchCursors, "Multicursor: Match new cursors with visual regex")

        map({ "v" }, "<leader>t", function()
        mc.transposeCursors(1) end, "Multicursor: Rotate next visual selection")
        map({ "v" }, "<leader>T", function()
        mc.transposeCursors(-1) end, "Multicursor: Rotate previous visual selection")

        -- map({ "n", "v" }, "<c-i>", mc.jumpForward, "Multicursor: Jump next")
        -- map({ "n", "v" }, "<c-o>", mc.jumpBackward, "Multicursor: Jump previous")

        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { bg = "#c7e1eb", fg = "#3d464a" })
    end,
}
