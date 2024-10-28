-- https://nvchad.com/nvim-colorizer.lua/modules/colorizer.html#user_default_options
return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = { "BufReadPost", "BufWinEnter" },
    config = function()
        require("colorizer").setup({
            filetypes = { "*", },
            user_default_options = {
                names = false,
                css = true,
                css_fn = true,
                tailwind = true,
                sass = {
                    enable = true,
                    parsers = { "css" },
                },
                always_update = true, -- update colour values even if buffer is not focused
            }

        })
    end,
}
