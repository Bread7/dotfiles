return {
	"3rd/image.nvim",
	-- lazy = true,
	-- event = "VeryLazy",
	dependencies = {
		{
			"kiyoon/magick.nvim",
			commit = "e047418",
		},
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local vault_path = vim.fn.expand("$HOME/Documents/Obsidian/zj/")
		local image = require("image")
		image.setup({
			backend = "kitty",
			integrations = {
				markdown = {
					clear_in_insert_mode = false,
					only_render_image_at_cursor = true,
					filetypes = { "markdown", "vimwiki" },
				},
				html = {
					enabled = true,
				},
				css = {
					enabled = false,
				},
			},
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "mason" },

			-- issue: https://github.com/3rd/image.nvim/issues/190
			resolve_image_path = function(document_path, image_path, fallback)
				-- document_path is the path to the file that contains the image
				-- image_path is the potentially relative path to the image. for
				-- markdown it's `![](this text)`
				local working_dir = vim.fn.getcwd()

				-- Image path for Obsidian
				if working_dir:find("/Users/zj/Documents/Obsidian/zj/") then
					-- if working_dir:find(vault_path) then
					return vim.fn.expand(working_dir) .. "/" .. vim.fn.expand(image_path)
				end

				-- Default behaviour
				return fallback(document_path, image_path)
			end,
		})
	end,
}

-- Issue: https://github.com/3rd/image.nvim/issues/91
-- Commit version: 88e9693
-- Working solution: https://github.com/kiyoon/magick.nvim

-- This plugin requires additional steps (Not working)
-- `brew install luajit luarocks imagemagick`
-- `luarocks --local --lua-version=5.1 install magick`
-- `cd $HOME/.luarocks/share/lua/5.1/magick/wand/`
-- `nvim lib.lua`
------- old
-- lib = try_to_load("MagickWand", function() ... end)
------- new
-- lib = try_to_load(
-- 	"/opt/homebrew/lib/libMagickWand-7.Q16HDRI.dylib",
-- 	-- "/opt/homebrew/lib/libMagickWand-7.Q16HDRI.10.dylib",
-- 	"/opt/homebrew/Cellar/imagemagick/7.1.1-39/lib/libMagickWand-7.Q16HDRI.dylib",
-- 	-- "/opt/homebrew/Cellar/imagemagick/7.1.1-39/lib/libMagickWand-7.Q16HDRI.10.dylib",
-- 	function() end
-- )
-------
-- Check imagemagick version `ls /opt/homebrew/lib | grep MagickWand`
