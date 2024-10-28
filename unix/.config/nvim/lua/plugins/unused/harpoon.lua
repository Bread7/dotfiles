return {
    "ThePrimeagen/harpoon",
    enabled = false,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

        -- Custom keymaps
        map("n", "<leader>ha", function() harpoon:list():add() end, "Harpoon: ")
        map("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Harpoon: ")
        for _, idx in ipairs { 1, 2, 3, 4, 5 } do
            vim.keymap.set("n", string.format("<space>%d", idx), function()
                harpoon:list():select(idx)
            end)
        end
    end,
}
