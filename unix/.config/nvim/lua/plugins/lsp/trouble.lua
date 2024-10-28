return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "folke/todo-comments.nvim",
    },
    opts = {
        focus = true,
    },
    cmd = "Trouble",
    keys = {
        { "<leader>tw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble: Open workspace diagnostics"},
        { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble: Open document diagnostics"},
        { "<leader>ts", "<cmd>Trouble symbols toggle<cr>", desc = "Trouble: Open symbols list"},
        { "<leader>tl", "<cmd>Trouble lsp toggle win.position=right<cr>", desc = "Trouble: Open LSP list"},
        { "<leader>tq", "<cmd>Trouble quickfix toggle<cr>", desc = "Trouble: Open quickfix list"},
        { "<leader>tL", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble: Open location list"},
        -- { "<leader>tt", "<cmd>Trouble todo toggle<cr>", desc = "Trouble: Open todos"},
    },
    config = function()
        require("trouble").setup({})
        vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "none", fg = "none" })
        vim.api.nvim_set_hl(0, "TroubleNormalNC", { bg = "none", fg = "none" })
        vim.api.nvim_set_hl(0, "TroubleCode", { bg = "none", fg = "none" })
        vim.api.nvim_set_hl(0, "TroublePreview", { bg = "none", fg = "none" })
        vim.api.nvim_set_hl(0, "TroublePos", { bg = "none", fg = "none" })
        vim.api.nvim_set_hl(0, "TroubleSource", { bg = "none", fg = "none" })
    end,
}
