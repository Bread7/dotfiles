local wezterm = require("wezterm")

-- Take configs from `/config`
local config = require("config")

require('events.format-tab').setup()
require('events.tab-button').setup()
require('events.left-status').setup()

  local opts = config:init()
  :append(require("config.domains"))
  :append(require("config.fonts"))
  :append(require("config.launchers"))
  :append(require("config.appearance"))
  :append(require("config.general"))
  :append(require("config.serials"))
  :append(require("config.bindings"))

local full_config = {}

-- Because `config.init` wraps the options in a table "options: {}"
-- Need get inner table and return it instead of returning options
for k,v in pairs(opts) do
  if k == "options" then
    full_config = v
  end
end

--print(full_config) -- Debugging purposes
return full_config

-- Inspirations taken from these sources
-- https://github.com/KevinSilvester/wezterm-config
-- https://github.com/scottmckendry/Windots
-- https://github.com/hendrikmi/dotfiles
