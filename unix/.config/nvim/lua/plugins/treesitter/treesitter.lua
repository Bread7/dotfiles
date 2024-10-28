return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = "VeryLazy",
    -- Uncomment this for first time setup
    -- build = ':TSUpdate',
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        -- local config = require("nvim-treesitter.configs")
        require("nvim-treesitter.configs").setup({
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
              enable = true,
              -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
              --  If you are experiencing weird indenting issues, add the language to
              --  the list of additional_vim_regex_highlighting and disabled languages for indent.
              additional_vim_regex_highlighting = false
            },
            indent = { enable = true, },
            --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`

            -- Matchup extensino configs
            matchup = {
                enable = true,
                -- disable = { "c", "ruby" },
                disable_virtual_text = false,
            }
        })
    end,
}
