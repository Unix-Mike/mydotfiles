local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- font settings
config.font_size = 12
-- config.font = wezterm.font 'FiraCode Nerd Font'
config.font = wezterm.font("BlexMono Nerd Font")
-- config.font = wezterm.font 'Monofur Nerd Font'

-- Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

-- Appearance
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.window_background_opacity = 0.9
-- config.color_scheme = 'Tango (terminal.sexy)'
-- config.color_scheme = 'Apple Classic'
-- config.color_scheme = 'Apple System Colors'
-- config.color_scheme = 'Ibm3270 (Gogh)'
-- config.color_scheme = "Ibm 3270 (High Contrast) (Gogh)"
-- config.color_scheme = 'iTerm2 Default'
config.color_scheme = 'Vibrant Ink (Gogh)'

config.initial_cols = 250
config.initial_rows = 60

config.window_frame = {
	font = require("wezterm").font("Roboto"),
	font_size = 12,
}

config.colors = {
	split = "yellow",
}

return config
