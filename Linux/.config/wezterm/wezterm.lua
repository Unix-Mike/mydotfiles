local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Font Settings
config.font_size = 12
config.line_height = 0.9
config.initial_cols = 150
config.initial_rows = 65

-- config.font = wezterm.font 'FiraCode Nerd Font'
-- config.font = wezterm.font 'BlexMono Nerd Font'
-- config.font = wezterm.font 'SauceCodePro Nerd Font'
-- config.font = wezterm.font 'Monofur Nerd Font'
config.font = wezterm.font 'Hack'
-- config.font = wezterm.font 'RecMonoCasual Nerd Font'
-- config.font = wezterm.font 'CaskaydiaCove Nerd Font'

-- Cursor type
config.default_cursor_style = "BlinkingBar"

-- Colors
config.colors = {
cursor_bg = "white",
cursor_border = "white",
split = 'yellow',
}


-- Appearance
config.window_padding = {
   left = 0,
   right = 0,
   top = 0,
   bottom = 0,
}

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'o',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'e',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

-- Color Schemes I like to use
config.color_scheme = 'Snazzy'

-- Window Transparency
config.window_background_opacity = 0.90


-- Window Frame
config.window_frame = {
  border_left_width = '0.25cell',
  border_right_width = '0.25cell',
  border_bottom_height = '0.15cell',
  border_top_height = '0.15cell',
  border_left_color = 'gray',
  border_right_color = 'gray',
  border_bottom_color = 'gray',
  border_top_color = 'gray',
  button_fg = 'white',
  button_bg = 'blue',
  font = require('wezterm').font 'Roboto',
  font_size = 10,
}

-- General Setting

return config
