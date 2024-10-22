local wezterm = require("wezterm")
local config = {}
config.color_scheme = "Aura (Gogh)"
config.font = wezterm.font("DankMono Nerd Font" , { weight = 'Bold' } )
config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
return config
