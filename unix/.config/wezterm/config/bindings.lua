local wezterm = require("wezterm")
local platform = require("utils.platform")()
local action = wezterm.action

local mod = {}

if platform.is_mac then
	mod.SUPER = "SUPER"
	mod.SUPER_REV = "SUPER|CTRL"
	mod.OPTION = "OPTION"
elseif platform.is_win or platform.is_linux then
	mod.SUPER = "ALT"
	mod.SUPER_REV = "ALT|CTRL"
end

local keys = {
	-- Function keybinds
	{ key = "F1", mods = "NONE", action = "ActivateCopyMode" },
	{ key = "F2", mods = "NONE", action = action.ActivateCommandPalette },
	{ key = "F3", mods = "NONE", action = action.ShowLauncher },
	{ key = "F4", mods = "NONE", action = action.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
	{ key = "F5", mods = "NONE", action = action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "F11", mods = "NONE", action = action.ToggleFullScreen },
	{ key = "F12", mods = "NONE", action = action.ShowDebugOverlay },

	-- String search and url opener
	{ key = "f", mods = mod.SUPER, action = action.Search({ CaseInSensitiveString = "" }) },
	{
		key = "u",
		mods = mod.SUPER,
		action = action.QuickSelectArgs({
			label = "open URL",
			patterns = {
				"\\((https?://\\S+)\\)",
				"\\[(https?://\\S+)\\]",
				"\\{(https?://\\S+)\\}",
				"<(https?://\\S+)>",
				"\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},

	-- Cursor movement
	--{ key = "LeftArrow", mods = mod.SUPER, action = action.SendString "\x1b0H" },

	-- Copy/paste
	{ key = "c", mods = mod.SUPER, action = action.CopyTo("Clipboard") },
	{ key = "v", mods = mod.SUPER, action = action.PasteFrom("Clipboard") },

	-- Tabs
	{ key = "t", mods = mod.SUPER, action = action.SpawnTab("DefaultDomain") },
	{ key = "t", mods = mod.SUPER_REV, action = action.CloseCurrentTab({ confirm = true }) },
	{ key = "w", mods = mod.SUPER, action = action.CloseCurrentTab({ confirm = true }) },
	{ key = "[", mods = mod.SUPER, action = action.ActivateTabRelative(-1) },
	{ key = "]", mods = mod.SUPER, action = action.ActivateTabRelative(1) },

	-- Window
	{ key = "n", mods = mod.SUPER, action = action.SpawnWindow },

	-- Panes
	{ key = "p", mods = mod.SUPER, action = action.CloseCurrentPane({ confirm = true }) },
	{ key = [[\]], mods = mod.SUPER, action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = [[\]], mods = mod.SUPER_REV, action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "Enter", mods = mod.SUPER, action = action.TogglePaneZoomState },
	{ key = "h", mods = mod.SUPER_REV, action = action.ActivatePaneDirection("Left") },
	{ key = "j", mods = mod.SUPER_REV, action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = mod.SUPER_REV, action = action.ActivatePaneDirection("Up") },
	{ key = "l", mods = mod.SUPER_REV, action = action.ActivatePaneDirection("Right") },

	-- Modes combine with key_tables
	{
		key = "F",
		mods = "LEADER",
		action = action.ActivateKeyTable({
			name = "resize_font",
			one_shot = false,
			timeout_miliseconds = 1000,
		}),
	},
	{
		key = "P",
		mods = "LEADER",
		action = action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			timeout_miliseconds = 1000,
		}),
	},

	-- Keys to send characters to terminal for FZF.fish configs
	{ key = "f", mods = "SUPER|SHIFT", action = action.SendString("\\cX@sf") }, -- Directory
	{ key = "l", mods = "SUPER|SHIFT", action = action.SendString("\\cX@sl") }, -- Git_log
	{ key = "s", mods = "SUPER|SHIFT", action = action.SendString("\\cX@ss") }, -- Git_status
	{ key = "p", mods = "SUPER|SHIFT", action = action.SendString("\\cX@sp") }, -- Processes
	{ key = "r", mods = "SUPER|SHIFT", action = action.SendString("\\cX@sr") }, -- History
	{ key = "v", mods = "SUPER|SHIFT", action = action.SendString("\\cX@sv") }, -- Environment variables

	-- Unbind keys
	{ key = "Tab", mods = "CTRL", action = action.DisableDefaultAssignment },
	{ key = "Tab", mods = "SHIFT|CTRL", action = action.DisableDefaultAssignment },
	{ key = "[", mods = "SHIFT|SUPER", action = action.DisableDefaultAssignment },
	{ key = "]", mods = "SHIFT|SUPER", action = action.DisableDefaultAssignment },
	{ key = "{", mods = "SHIFT|SUPER", action = action.DisableDefaultAssignment },
	{ key = "}", mods = "SHIFT|SUPER", action = action.DisableDefaultAssignment },
}

local key_tables = {
	resize_font = {
		{ key = "=", action = action.IncreaseFontSize },
		{ key = "-", action = action.DecreaseFontSize },
		{ key = "r", action = action.ResetFontSize },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
	resize_pane = {
		{ key = "h", action = action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
}

local mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = action.OpenLinkAtMouseCursor,
	},
}

return {
	--disable_default_key_bindings = false,
	--leader = { key = "Space", mods = mod.SUPER_REV },
	leader = { key = "Space", mods = "SHIFT" },
	keys = keys,
	key_tables = key_tables,
	mouse_bindings = mouse_bindings,
}
