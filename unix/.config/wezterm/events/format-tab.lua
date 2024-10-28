local wezterm = require("wezterm")
local nf = wezterm.nerdfonts

local GLYPH_ALERT = nf.md_alert_circle -- [[ '󰀨' ]]
local GLYPH_SEMI_CIRCLE_LEFT = nf.ple_left_half_circle_thick --[[ '' ]]
local GLYPH_SEMI_CIRCLE_RIGHT = nf.ple_right_half_circle_thick --[[ '' ]]
local GLYPH_ADMIN = nf.md_robot_love --[[ '󱚥' ]]

local colours = {
  default = { bg = '#5a4559', fg = '#1c1b19' },
  is_active = { bg = '#e075e0', fg = '#11111b' },
  hover = { bg = '#a859a6', fg = '#1c1b19' },
}

--- Set up config and individual cells tab bar
local config = {}
local cells = {}

---@param s string Absolute filepath name in unix or windows separator
---@return string name The current running process in the tab only, no filepath as prefix
local set_process_name = function(s)
    local name = string.gsub(s, '(.*[/\\])(.*)', '%2')
    name = name:gsub("%.exe$", '')
    return name
end

---@param process_name string
---@param base_title string Taken from active pane information
---@param max_width number
---@param inset any
local set_title = function(process_name, base_title, max_width, inset)
    local title
    inset = inset or 6

    if process_name:len() > 0 then
        title = process_name .. "~" .. base_title
    else
        title = base_title
    end

    if title:len() > max_width - inset then
        local diff = title:len() - max_width + inset
        title = wezterm.truncate_right(title, title:len() - diff)
    end
    return title
end

---@param title string Takes in title string from tab bar to check for admin privileges (e.g. sudo, admin)
---@return boolean # Returns boolean if tab bar has privileges
local check_admin = function(title)
    if title:match("^Administrator: ") or title:match("^sudo ") then
        return true
    end
    return false
end

---@param bg string
---@param fg string
---@param text string
---@see Requires a local table to be created and pushes the 4 params into the table to manipulate styling of each tab
local push = function(bg, fg, attribute, text)
    table.insert(cells, { Background = { Color = bg } })
    table.insert(cells, { Foreground = { Color = fg } })
    table.insert(cells, { Attribute = attribute })
    table.insert(cells, { Text = text })
end

config.setup = function()
    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        cells = {}

        local bg
        local fg
        local process_name = set_process_name(tab.active_pane.foreground_process_name)
        local is_admin = check_admin(tab.active_pane.title)
        local title = set_title(process_name, tab.active_pane.title, max_width, (is_admin and 15))

        if tab.is_active then
            bg = colours.is_active.bg
            fg = colours.is_active.fg
        elseif hover then
            bg = colours.hover.bg
            fg = colours.hover.fg
        else
            bg = colours.default.bg
            fg = colours.default.fg
        end

        local has_unseen_output = false
        for _, pane in ipairs(tab.panes) do
            if pane.has_unseen_output then
                has_unseen_output = true
                break
            end
        end

        -- Left semi-circle
        push('rgba(0, 0, 0, 0.4)', bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_LEFT)

        -- Admin icon
        if is_admin then
            push(bg, fg, { Intensity = 'Bold' }, ' ' .. GLYPH_ADMIN)
        end

        -- Title
        push(bg, fg, { Intensity = 'Bold' }, ' ' .. title)

        -- Unseen output alert
        if has_unseen_output then
            push(bg, "#FFA066", { Intensity = 'Bold' }, ' ' .. GLYPH_ALERT)
        end

        -- Right padding
        push(bg, fg, { Intensity = 'Bold' }, ' ')

        -- Right semi-circle
        push('rgba(0, 0, 0, 0.4)', bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_RIGHT)

        return cells

    end)
end

return config
