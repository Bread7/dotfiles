-- https://github.com/pavel-hrdina/dotfiles/blob/master/nvim/.config/nvim/lua/custom/plugins/dashboard.lua
-- https://github.com/GustafB/dotfiles/blob/master/config/nvim/lua/cafebabe/lazy/dashboard.lua
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	init = false,
	dependencies = {
		{
			"juansalvatore/git-dashboard-nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	-- priority = 2000,
	config = function()
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local one_piece_flag = [[
      ⠀⠀⠀⠀⢀⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣤⡀⠀⠀⠀⠀
      ⠀⠀⠀⠀⣾⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣷⠀⠀⠀⠀
      ⠀⣴⣶⣾⣿⣿⣿⣿⡋⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣷⣶⣄⠀
      ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⣠⣾⠏⢹⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⢷⣄⠀⠀⠀⠀⢀⣰⣿⣿⣿⣿⣿⣿⣿⣿⠀
      ⠀⠙⠻⠿⠛⠉⠻⣿⣿⣿⣿⣦⡀⢀⣼⣿⢁⣼⠏⣠⡟⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⢻⣷⡀⢿⣷⡀⢀⣴⣿⣿⣿⣿⠟⠉⠻⠿⠿⠋⠀
      ⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡿⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁⠈⠉⠁⠀⢻⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠃⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⠿⠋⠉⠉⠻⣿⣿⣿⣿⣿⣿⠟⠋⠉⠙⠻⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⡏⠀⠀⠀⠀⠀⠈⢻⣿⣿⡿⠁⠀⠀⠀⠀⠀⠸⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⡇⠀⠀⠀⠀⠀⠀⣸⣿⣿⣧⠀⠀⠀⠀⠀⠀⢀⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣿⣄⣀⠀⠀⣀⣴⣿⣿⣿⣿⣧⣀⡀⠀⢀⣀⣼⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣿⣿⣿⣿⣿⣯⡀⠀⣸⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢀⣤⣍⣙⠛⠛⠛⠿⠿⠛⠛⠛⣋⣩⣤⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡇⡘⠿⣿⡏⢸⣿⣷⣶⢰⣶⣿⡇⣿⣿⡿⠃⢸⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠠⣿⣷⣶⠁⣌⣉⣛⠛⠘⣛⣋⡁⢨⣶⣶⣿⡸⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⢀⣴⣶⣦⣄⣤⣾⣿⣿⣿⡿⢰⣮⡉⠛⢠⣿⣿⣿⣿⢸⣿⣿⣿⠈⠟⢋⣩⡄⣿⣿⣿⣿⣷⣄⣠⣴⣶⣦⡀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠈⣿⣿⣿⣷⣶⣤⣤⣤⣤⣤⣤⣴⣶⣿⣿⣿⠁⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠘⠿⠿⣿⣿⣿⣿⣯⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⣿⣿⣿⣿⡿⠿⠟⠁⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠃⠀⠀⠀⠀⠸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠙⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠛⠋⠀⠀⠀
      ]]

		local luffy = [[⠀        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                          ⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡴⠖⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠲⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠙⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⣰⠋⠀⡆⢀⠀⠀⠀⢤⢾⣱⣜⣾⣧⣶⣶⣶⣿⣷⣷⣶⣦⣤⣄⡀⣼⣞⣆⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⡿⡏⡇⡄⢀⣼⣷⣿⣿⣿⣿⣿⣿⡿⠿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣢⡀⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⣰⡇⠀⠀⣤⠻⡽⣼⣿⣿⣿⣿⡿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠷⢦⣀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⣿⠀⠀⠀⣌⢷⣿⣿⡿⠟⢋⡡⠀⠀⢀⣠⣤⣴⣶⣿⣿⣿⣿⣿⣷⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⣈⡙⠶⣤⡀⠀⠀⠀
			⠀⠀⠀⠀⠀⣿⠀⠀⢦⣸⠛⠛⢁⡀⣀⣈⢀⣴⣾⣿⣿⣿⠏⣿⢿⣿⣿⣿⡏⠈⢻⣿⠿⣿⣶⣔⢿⣦⣠⣮⣽⠛⠀⠀⠙⢦⠀⠀
			⠀⠀⠀⠀⠀⢿⠀⣠⠞⢩⣴⣿⡿⡿⣯⣷⣿⣿⣿⣿⣿⠏⢠⡿⢸⣿⣿⡟⠀⠀⠀⢻⡆⠘⣿⣿⣷⣝⠺⣿⣦⠀⠀⠀⠀⠀⢳⡀
			⠀⠀⠀⠀⠀⣨⠟⠁⠐⢷⡹⠋⣰⣿⣿⣿⣿⣿⣿⣿⠏⠀⢸⠃⢸⣿⡟⠀⠀⠀⠀⠸⡇⠀⠘⣿⣿⣿⣷⣄⡁⠀⠀⠀⠀⠀⠈⡇
			⠀⠀⠀⣠⠞⠁⠀⠀⠀⠈⢀⣼⣿⣿⣿⣿⠏⢸⣿⠇⠀⠠⠏⠀⢸⠏⠀⠀⠀⠀⠀⠀⠇⠀⠀⢸⣿⣿⣏⠉⡉⡀⠀⠀⠀⠀⣰⡇
			⠀⠀⡼⠁⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⡟⠀⢸⡟⠀⠀⠀⠀⠘⡏⣀⣿⡒⡿⠀⠀⠀⣀⠀⠀⠈⣿⣿⣿⣧⣿⣿⡆⠀⠀⣠⠏⠀
			⠀⣼⠃⠀⢀⣶⣖⡄⠀⣾⣿⣿⣿⣿⣿⠃⠀⢸⣛⣲⣦⣤⣤⣤⣴⡟⠙⣷⣤⣤⠴⠾⠥⣤⡀⠀⣿⣿⡿⠿⣿⣿⠃⢀⡴⠁⠀⠀
			⢸⡇⠀⠀⣼⣸⣻⢀⢰⣿⣿⣿⣿⣿⣿⠀⠸⢿⣶⣶⣦⠶⠋⡼⠟⠀⠀⡏⠉⣟⠻⣿⠿⣋⠁⠀⣿⣿⣮⣨⡾⣣⡼⠋⠀⠀⠀⠀
			⢸⡇⠀⠀⣿⣿⢸⡻⣸⣿⡟⣭⢿⣿⡽⠄⠀⠀⠀⠀⠀⠀⠀⣠⣶⡀⠀⢻⣲⡦⣉⡋⠙⠏⠀⢸⠋⣞⣹⠗⠋⠁⠀⠀⠀⠀⠀⠀
			⠘⣇⠀⠀⢿⣾⣯⣝⠮⢹⣇⠇⣷⡹⣧⠀⠀⠀⠀⢀⡠⠚⠀⠀⠈⠁⠀⠘⠉⠀⠀⠙⢦⠀⠀⢸⣾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠘⣆⠈⡪⠽⣿⣽⠶⠚⠻⣮⣙⠳⢿⡄⠀⠀⠀⠋⠀⠀⢀⣠⠤⠤⠤⠤⢄⣀⠀⠀⠈⠇⠀⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠘⢶⣍⢻⠒⢺⠾⠩⠽⡇⣈⣙⣶⣷⡀⠀⠀⢀⡤⠚⠉⢀⣤⢴⢶⣤⣄⠉⠙⠲⢤⡀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠈⠉⠋⠉⠉⠉⠉⠉⠀⠀⠀⠈⠻⣦⣀⡉⢀⡠⠞⠉⢠⠏⠘⡄⠻⡍⠲⢦⣤⠷⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡶⣤⣤⣄⣀⣤⣥⣤⣶⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡏⠛⠿⢿⣿⣿⡿⣿⡃⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⠇⠀⠀⠀⠉⢻⣿⣿⣣⢿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣴⣶⣿⣿⣯⠀⠀⠀⠀⠀⠀⠘⠛⠋⠈⠋⠙⣿⣷⣦⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀
			⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀]]

		local pikachu = [[
        ⢰⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀
        ⠀⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿
        ⠀⠘⢿⣿⣿⣿⣿⣦⣀⣀⣀⣄⣀⣀⣠⣀⣤⣶⣿⣿⣿⣿⣿⠇
        ⠀⠀⠈⠻⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀
        ⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠋⠀⠀⠀
        ⠀⠀⠀⢠⣿⣿⡏⠆⢹⣿⣿⣿⣿⣿⣿⠒⠈⣿⣿⣿⣇⠀⠀⠀
        ⠀⠀⠀⣼⣿⣿⣷⣶⣿⣿⣛⣻⣿⣿⣿⣶⣾⣿⣿⣿⣿⡀⠀⠀
        ⠀⠀⠀⡁⠀⠈⣿⣿⣿⣿⢟⣛⡻⣿⣿⣿⣟⠀⠀⠈⣿⡇⠀⠀
        ⠀⠀⠀⢿⣶⣿⣿⣿⣿⣿⡻⣿⡿⣿⣿⣿⣿⣶⣶⣾⣿⣿⠀⠀
        ⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀
        ⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀]]

		local logos = {
			pikachu,
			one_piece_flag,
			luffy,
		}

		local function pick_color()
			local colors = { "String", "Identifier", "Keyword", "Number" }
			return colors[math.random(#colors)]
		end

		local function pad(n)
			return { type = "padding", val = n }
		end

		local function whitespace_only(str)
			return str:match("^%s*$") ~= nil
		end

		local function format_git_header()
			local git_dashboard_raw = require("git-dashboard-nvim").setup({})
			local git_dashboard = {}
			for _, line in ipairs(git_dashboard_raw) do
				if not whitespace_only(line) then
					table.insert(git_dashboard, line)
				end
			end

			local git_repo = git_dashboard[1]
			local git_branch = git_dashboard[#git_dashboard]

			if git_repo == nil and git_branch == nil then
				return {
					type = "text",
					val = "",
					opts = { position = "center" },
				}, {}
			end

			local git_branch_section = {
				type = "text",
				val = " " .. git_repo .. ":" .. string.sub(git_branch, 5, #git_branch),
				opts = { position = "center" },
			}

			return git_branch_section, { unpack(git_dashboard, 2, #git_dashboard - 1) }
		end

		local function center_header(header)
			local lines = {}
			for line in string.gmatch(header, "[^\n]+") do
				table.insert(lines, line)
			end

			local width = vim.api.nvim_win_get_width(0) -- Get the width of the current window
			local padding = math.floor((width - #lines[1]) / 2) -- Calculate padding based on the first line length
			for i, line in ipairs(lines) do
				lines[i] = string.rep(" ", padding) .. line
			end
			return lines
		end

		-- Layout formatting

		-- Header
		local header_color = pick_color()

		local git_branch_section, commit_history = format_git_header()
		local history = ""
		for _, line in ipairs(commit_history) do
			history = history .. "\n" .. string.rep(" ", 3) .. line
		end
		dashboard.section.history = {
			type = "text",
			val = history,
			opts = {
				position = "center",
				hl = header_color,
			},
		}
		dashboard.section.branch = {
			type = "text",
			val = git_branch_section,
			opts = {
				position = "center",
				hl = header_color,
			},
		}

		math.randomseed(os.time())
		local logo = logos[math.random(#logos)]
		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.header.opts.hl = header_color
		dashboard.section.header.opts.position = "center"

		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file", "<cmd>FzfLua files cwd=$HOME<cr>"),
			dashboard.button("r", "󱑁 " .. " Recent files", "<cmd>FzfLua oldfiles<cr>"),
			dashboard.button("h", " " .. " Command History", "<cmd>FzfLua command_history<cr>"),
			dashboard.button("c", " " .. " Config", "<cmd>FzfLua files cwd=$HOME/.config<cr>"),
			dashboard.button("n", " " .. " Neovim Config", "<cmd>FzfLua files cwd=$HOME/.config/nvim<cr>"),
			dashboard.button("l", "󰒲 " .. " Lazy", "<cmd>Lazy<cr>"),
			dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
		}

		-- Quote of the day from file
		local open = io.open
		local quotes_path = vim.fn.expand("$HOME/.config/nvim/misc/quotes.txt")
		local function get_quote()
			local file = open(quotes_path, "rb")
			if not file then
				return ""
			end
			local content = file:read("*a") -- *a or *all reads whole file
			file:close()
			local quotes = {}
			for line in string.gmatch(content .. "\n", "(.-)\n") do
				table.insert(quotes, line)
			end
			return quotes[math.random(#quotes)]
		end

		dashboard.section.middle = {
			type = "text",
			val = get_quote(),
			opts = {
				position = "center",
				hl = pick_color(),
			},
		}

		local footer_color = pick_color()
		dashboard.section.greeter = {
			type = "text",
			val = "Hi BreadTheSire, how are you doing today?",
			opts = {
				position = "center",
				hl = footer_color,
			},
		}

		-- alpha.setup(dashboard.config)
		alpha.setup({
			layout = {
				pad(2),
				dashboard.section.header,
				pad(2),
				dashboard.section.history,
				pad(4),
				git_branch_section,
				pad(1),
				dashboard.section.buttons,
				pad(2),
				dashboard.section.middle,
				pad(2),
				dashboard.section.greeter,
				pad(1),
				dashboard.section.footer,
			},
			position = "center",
		})

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				dashboard.section.footer.opts.hl = footer_color
				dashboard.section.footer.opts.position = "center"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
