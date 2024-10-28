return {
    "folke/which-key.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    -- init = function()
    -- end,
    config = function()
        vim.o.timeout = true
        require("which-key").setup({})
    end,
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "WhichKey: Buffer local keymaps",
        },

    },
}
