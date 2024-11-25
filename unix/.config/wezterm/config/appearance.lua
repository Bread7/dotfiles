local wezterm = require("wezterm")
local gpus = wezterm.gui.enumerate_gpus()

return {
	-- FPS settings
	animation_fps = 240,
	max_fps = 240,
	--anti_alias_custom_block_glyphs = true,

	-- GPU acceleration
	front_end = "WebGpu",
	--webgpu_force_fallback_adapter = true,
	webgpu_power_preference = "HighPerformance",

	-- Colour scheme
	color_scheme = "Catppuccin Mocha",

	-- Background
	window_background_opacity = 0.85,
	--macos_window_background_blur = 15,

	-- Window
	adjust_window_size_when_changing_font_size = false,
	initial_rows = 45,
	initial_cols = 180,
	window_decorations = "TITLE | RESIZE",
	window_padding = {
		left = 5,
		right = 10,
		top = 12,
		bottom = 7,
	},
	--window_frame = {
	--active_titlebar_fg = "#d490aa87",
	--},

	-- Tabs
	--use_fancy_tab_bar = false,
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	tab_max_width = 30,

	-- Command Palette
	command_palette_bg_color = "#313244",
	command_palette_fg_color = "rgba(230, 230, 250, 1)",
	command_palette_rows = 60,

	-- Cursor
	default_cursor_style = "BlinkingBlock",

	-- Scrollbar
	enable_scroll_bar = true,
	scrollback_lines = 5000,
}
