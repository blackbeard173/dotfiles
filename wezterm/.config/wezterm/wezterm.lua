local wezterm = require("wezterm")

local config = {
	audible_bell = "Disabled",
	color_scheme = "Tokyo Night",
	default_cursor_style = "BlinkingBar",
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" }),
	font_size = 13.0,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
}

return config
