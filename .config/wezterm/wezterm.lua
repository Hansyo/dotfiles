-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Color Scheme
config.color_scheme = "Nightfly (Gogh)"
config.color_schemes = {
	["Nightfly (Gogh)"] = {
		cursor_fg = "#080808",
		cursor_bg = "#9ca1aa",
		selection_fg = "#080808",
		selection_bg = "#b2ceee",
	},
}

-- Font Config -> font.lua
local font_settings = require("font")
config.font = font_settings.font
config.font_rules = font_settings.font_rules

-- Disable tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Set window Looks
--- Opacity
config.window_background_opacity = 0.8
-- config.text_background_opacity = 0.8
--- Padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Set term name
config.term = "wezterm"

-- Set key bindings
local act = wezterm.action
config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "m",
		mods = "CMD",
		action = act.DisableDefaultAssignment,
	},
}

-- and finally, return the configuration to wezterm
return config
