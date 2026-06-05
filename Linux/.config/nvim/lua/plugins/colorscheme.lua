-- catppuccin + gruvbox colorscheme configuration

require("catppuccin").setup({
	flavour = "frappe",
	transparent_background = true,
        styles = {
           sidebars = "transparent",
           floats = "transparent",
        },
})

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

require('onedark').setup {
    style = 'deep',
    transparent = 'true',
}

require("cyberdream").setup({
    -- Set light or dark variant
    variant = "dark", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

    -- Enable transparent background
    transparent = false,

    -- Reduce the overall saturation of colours for a more muted look
    saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

    -- Enable italics comments
    italic_comments = true,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = false,

    -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
    borderless_pickers = false,

    -- Set terminal colors used in `:terminal`
    terminal_colors = true,

    -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
    cache = false,

	colors = {
		-- bg = "#0b0040", -- Darkish Purple
		bg = "#000833", -- Dark Blue
	}
})


require("night-owl").setup({
    -- These are the default settings
    bold = true,
    italics = true,
    underline = true,
    undercurl = true,
    transparent_background = false,
})



