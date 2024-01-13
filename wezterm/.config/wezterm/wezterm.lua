local wezterm = require("wezterm")

local config = {
	audible_bell = "Disabled",
	color_scheme = "carbonfox",
	default_cursor_style = "BlinkingBar",
	font = wezterm.font("Dank Mono", { weight = "Bold" }),
	font_size = 14.0,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
}

return config
