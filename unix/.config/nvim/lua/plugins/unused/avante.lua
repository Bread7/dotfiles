-- ref: https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/avante.lua
return {
	{
		"yetone/avante.nvim",
        enabled = false,
        event = "VeryLazy",
        lazy = false,
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            "nvim-treesitter/nvim-treesitter",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
			},
		},
        config = function()
            require("avante").setup({
                system_prompt = [[
                    Act as an expert software developer, expert log analyser and manager.
                    Always use best practices when coding.
                    Respect and use existing conventions, libraries, etc that are already present in the code base.
                ]],
                provider = "openai",
                auto_suggestions_provider = "openai",
                openai = {
                    endpoint = "https://api.openai.com/v1",
                    model = "gpt-4o", -- ["o1-preview", "o1-mini", "gpt-4o"]
                    timeout = 120000, -- Timeout in milliseconds
                    temperature = 1,
                    max_tokens = 4096, -- 4096
                    ["local"] = false,
                },
            })
        end,
	},
}
