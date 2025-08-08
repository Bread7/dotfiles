return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			thousands = ",",
			relculright = true,

			-- Configure for ui/ufo
			segments = {
				{
					text = { builtin.foldfunc, " " },
					click = "v:lua.ScFa",
					sign = { maxwidth = 1, colwidth = 1, auto = true },
				},
				{ text = { "%s" }, click = "v:lua.ScSa", sign = { maxwidth = 1, colwidth = 1, auto = true } },
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
					sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
				},
			},
		})
	end,
}
