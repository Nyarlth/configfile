hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,

		border_size = 0,

		col = {
			active_border = {
				colors = { "rgba(ff000000)", "rgba(ffffffff)", "rgba(ff000000)", "rgba(ffffffff)" },
				angle = 45,
			},
			inactive_border = "rgba(11707b7c)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "scrolling",
	},

	decoration = {
		rounding = 10,
		rounding_power = 4,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 5,
			render_power = 4,
			color = 0xffa7caff,
			color_inactive = 0x50000000,
		},

		blur = {
			enabled = true,
			size = 1,
			passes = 2,
			vibrancy = 0.1696,
			ignore_opacity = false,
		},
	},
	xwayland = {
		force_zero_scaling = true,
	},
})
