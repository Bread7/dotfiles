local wezterm = require("wezterm")

---@param str string
---@param pattern string
---@return boolean
local function find_os (str, pattern)
  return string.find(str, pattern) ~= nil
end

local function platform()
  local is_win = find_os(wezterm.target_triple, 'windows')
  local is_linux = find_os(wezterm.target_triple, 'linux')
  local is_mac = find_os(wezterm.target_triple, 'apple')
  local os = is_win and 'windows' or is_linux and 'linux' or is_mac and 'apple' or 'unknown'
  return {
    os = os,
    is_win = is_win,
    is_linux = is_linux,
    is_mac = is_mac,
  }
end

return platform

