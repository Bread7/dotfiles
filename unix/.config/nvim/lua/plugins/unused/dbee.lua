-- ref: https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dbee.lua
return {
	{
		"kndndrj/nvim-dbee",
		enabled = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		build = function()
			require("dbee").install()
		end,
		config = function()
			local source = require("dbee.sources")
			require("dbee").setup({
				sources = {
					source.MemorySource:new({
						---@diagnostic disable-next-line: missing-fields
						{
							type = "postgres",
							name = "mixery",
							url = "postgresql://tjdevries:password@localhost:5432/mixery",
						},
					}, "mixery"),
				},
			})
			require("custom.dbee")
		end,
	},
}

