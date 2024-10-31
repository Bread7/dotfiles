local wezterm = require("wezterm")
local platform = require("utils.platform")

local default_font = "FantasqueSansM Nerd Font Propo"
local default_font_size = platform().is_mac and 13 or 9

return {
	--font = wezterm.font(default_font),
	-- font_size = 14,
	font_size = default_font_size,
	font = wezterm.font_with_fallback({
		default_font,
		"JetBrainsMono Nerd Font",
		"Iosevka Nerd Font",
		"SauceCodePro Nerd Font Mono",
		"FantasqueSansM Nerd Font",
		"Inconsolata Nerd Font Mono",
		-----------------------------------
		"ZedMono Nerd Font Mono",
		"SpaceMono Nerd Font",
		"0xProto Nerd Font Mono",
		"iMWritingMono Nerd Font Mono",
	}),

	-- https://wezfurlong.org/wezterm/config/lua/config/freetype_load_target.html
	freetype_load_target = "Normal", ---@type 'Normal'|'Light'|'Mono'
	freetype_render_target = "Normal", ---@type 'Normal'|'Light'|'Mono'
}
