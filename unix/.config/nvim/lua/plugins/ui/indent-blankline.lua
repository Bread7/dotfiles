return {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = "VeryLazy",
    -- version = "previous version tag",
    main = 'ibl',
    opts = {
        indent = {
            char = '┊',
        },
        scope = {
            show_start = false,
            show_end = false,
            show_exact_scope = false,
        },
        exclude = {
            filetypes = {
                'help',
                'startify',
                'dashboard',
                'packer',
                'neogitstatus',
                'NvimTree',
                'Trouble',
            },
        },
    },
}
