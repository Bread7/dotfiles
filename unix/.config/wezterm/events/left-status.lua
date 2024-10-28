local wezterm = require("wezterm")

local nf = wezterm.nerdfonts

local GLYPH_SEMI_CIRCLE_LEFT = nf.ple_left_half_circle_thick --[[ '' ]]
local GLYPH_SEMI_CIRCLE_RIGHT = nf.ple_right_half_circle_thick --[[ '' ]]
local GLYPH_KEY_TABLE = nf.md_table_key --[[ '󱏅' ]]
local GLYPH_KEY = nf.md_key --[[ '󰌆' ]]

local colours = {
    glyph_semi_circle = { bg = "rgba(0, 0, 0, 0.4)", fg = "#87c4fa"},
    text = { bg = "#87faf6", fg = "#1c1c19" },
}

local config = {}
local cells = {}

---@param text string
---@param fg string
---@param bg string
local push = function(text, fg, bg)
    table.insert(cells, { Foreground = { Color = fg } })
    table.insert(cells, { Background = { Color = bg } })
    table.insert(cells, { Attribute = { Intensity = "Bold" } })
    table.insert(cells, { Text = text })
end

config.setup = function()
    wezterm.on("update-right-status", function(window, pane) 
        cells = {}

        local name = window:active_key_table()
        if name then
            push(GLYPH_SEMI_CIRCLE_LEFT, colours.glyph_semi_circle.fg, colours.glyph_semi_circle.bg)
            push(GLYPH_KEY_TABLE, colours.text.fg, colours.text.bg)
            push(' ' .. string.upper(name), colours.text.fg, colours.text.bg)
            push(GLYPH_SEMI_CIRCLE_RIGHT, colours.glyph_semi_circle.fg, colours.glyph_semi_circle.bg)
        end

        if window:leader_is_active() then
            push(GLYPH_SEMI_CIRCLE_LEFT, colours.glyph_semi_circle.fg, colours.glyph_semi_circle.bg)
            push(GLYPH_KEY, colours.text.fg, colours.text.bg)
            push(' ', colours.text.fg, colours.text.bg)
            push(GLYPH_SEMI_CIRCLE_RIGHT, colours.glyph_semi_circle.fg, colours.glyph_semi_circle.bg)
        end

        window:set_left_status(wezterm.format(cells))
    end)
end

return config
