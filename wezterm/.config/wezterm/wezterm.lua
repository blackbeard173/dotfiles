local wezterm = require("wezterm")

local config = {
	audible_bell = "Disabled",
	color_scheme = "rose-pine",
	default_cursor_style = "BlinkingBar",
	font = wezterm.font("Berkeley Mono", { weight = "Regular" }),
	font_size = 14.0,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_decorations = "RESIZE",
}

return config
