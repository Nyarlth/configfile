hl.monitor({
	output = "eDP-1",
	mode = "3072x1920@120",
	position = "0x0",
	scale = 2,
})

hl.monitor({
	output = "DP-1",
	mode = "preferred",
	-- position = "1536x-960",
	scale = 1,
	-- transform = 3,
	disabled = true,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "3072x1920@30",
	position = "0x0",
	scale = 2,
	mirror = "eDP-1",
	disabled = true,
})

-- hl.workspace_rule({ workspace = "20", layout_opts = { direction = "up" } })
