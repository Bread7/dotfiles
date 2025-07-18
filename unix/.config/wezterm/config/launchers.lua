local platform = require("utils.platform")()

local options = {
	default_prog = {},
	launch_menu = {},
}

if platform.is_win then
	options.default_prog = { "pwsh" }
	options.launch_menu = {
		{ label = "Powershell Core", args = { "pwsh" } },
		{ label = "Powershell Desktop", args = { "powershell" } },
		{ label = "Command Prompt", args = { "cmd" } },
		{ label = "Nushell", args = { "nu" } },
	}
elseif platform.is_linux then
	options.default_prog = { "fish", "-l" }
	options.launch_menu = {
		{ label = "Bash", args = { "bash", "-l" } },
		{ label = "Fish", args = { "fish", "-l" } },
		{ label = "Zsh", args = { "zsh", "-l" } },
	}
elseif platform.is_mac then
	options.default_prog = { "/opt/homebrew/bin/fish", "-l" }
	-- options.default_prog = { "fish", "-l" }
	options.launch_menu = {
		{ label = "Fish", args = { "fish", "-l" } },
		{ label = "Bash", args = { "bash", "-l" } },
		{ label = "Zsh", args = { "zsh", "-l" } },
	}
end

return options
