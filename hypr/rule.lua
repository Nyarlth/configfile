hl.layer_rule({
	match = { namespace = "gtk-layer-shell" },
	blur = true,
	ignore_alpha = 0,
})

hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
	ignore_alpha = 0,
})

hl.window_rule({
	match = { content = 0 },
	no_blur = true,
})

-- Wechat
hl.window_rule({
	match = { class = "wechat" },
	workspace = "10",
})
hl.window_rule({
	match = { class = "wechat", title = "预览" },
	float = true,
	size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
	move = { "(cursor_x-(window_w*0.5))", "(cursor_y-(window_h*0.5))" },
})
hl.window_rule({
	match = { class = "wechat", title = "wechat" },
	float = true,
	move = { "(cursor_x-(window_w*0.5))", "(cursor_y-(window_h*0.5))" },
	border_size = 0,
	no_shadow = true,
})

-- firefox
hl.window_rule({
	match = { class = "firefox" },
	workspace = "2",
	scrolling_width = 1,
	opacity = "1 override",
})
hl.window_rule({
	match = { class = "firefox", title = "Library" },
	float = true,
	size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
	move = { "(monitor_w * 0.5 -(window_w*0.5))", "(monitor_h * 0.5 -(window_h*0.5))" },
})

-- Alacritty
hl.window_rule({
	match = { class = "Alacritty" },
	no_blur = false,
})
---- Float Alacritty
hl.window_rule({
	match = { initial_title = "FloatTTY" },
	no_blur = true,
	float = true,
	no_shadow = true,
	move = { "(monitor_w * 0.5 -(window_w*0.5))", "(monitor_h * 0.5 -(window_h*0.5))" },
})

-- Rofi
hl.window_rule({
	match = { class = "Rofi" },
	stay_focused = true,
	no_blur = false,
})

-- v2ray
hl.window_rule({
	match = { class = "v2rayN" },
	workspace = "special:proxy silent",
})

-- Nautilus File
hl.window_rule({
	match = { class = "org.gnome.Nautilus" },
	float = true,
	center = true,
	size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
})

hl.window_rule({
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
	center = true,
	size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
})

hl.window_rule({
	match = { class = "org.gnome.NautilusPreviewer" },
	float = true,
	center = true,
	size = { "(monitor_w*0.5)", "(monitor_h)" },
})

-- Steam
hl.window_rule({
	match = { class = "steam" },
	workspace = "9 silent",
})

hl.window_rule({
	match = { class = "steam", title = "Friends List" },
	float = true,
	center = true,
})

-- feh
hl.window_rule({
	match = { class = "feh" },
	no_blur = true,
	float = true,
	pin = true,
	center = true,
})

hl.window_rule({
	match = { title = "OPT" },
	opacity = "0.5 override",
})

-- wemeet
hl.window_rule({
	match = { title = "wemeetapp" },
	pin = true,
	no_blur = true,
	no_shadow = true,
	border_size = 0,
})

-- Typora
hl.window_rule({
	match = { class = "Typora" },
	opacity = "1 override",
})

-- nvim

-- opacity
hl.window_rule({
	match = { class = "Zotero" },
	opacity = "1 override",
})

hl.window_rule({
	match = { class = "matplotlib" },
	opacity = "1 override",
})

hl.window_rule({
	match = { class = "texstudio" },
	opacity = "1 override",
})

-- workspace
hl.window_rule({
	match = { class = "com.obsproject.Studio" },
	workspace = "9",
})

-- python3 fig
hl.window_rule({
	match = { class = "python3" },
	float = true,
	center = true,
	size = { "(monitor_w*0.4)", "(monitor_h*0.4)" },
})
