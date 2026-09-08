local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("alacritty"), { description = "Open the terminal" })

hl.bind(
	mainMod .. " + F",
	hl.dsp.exec_cmd("[silent;float;noanim] alacritty --config-file ~/.config/alacritty/f_alacritty.toml"),
	{ description = "Open floating terminal" }
)

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Kill active window" })

hl.bind(mainMod .. " + F9", hl.dsp.exec_cmd("hyprlock"), { description = "Lock screen" })

hl.bind(mainMod .. " + END", hl.dsp.exec_cmd("hyprctl dispatch exit"), { description = "Exit Hyprland" })

hl.bind(
	mainMod .. " + HOME",
	hl.dsp.exec_cmd("hyprctl clients >> /home/zxy/cache"),
	{ description = "Save Hyprland clients" }
)

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })

-- hl.bind(mainMod .. " + P",
--     hl.dsp.layout("pseudo"),
--     { description = "Toggle pseudo" })

-- hl.bind(mainMod .. " + J",
--     hl.dsp.layout("togglesplit"),
--     { description = "Toggle split" })

-- hl.bind(mainMod .. " + F",
--     hl.dsp.exec_cmd("firefox"),
--     { description = "Open Firefox" })

hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("~/.config/Script/menu.sh"), { description = "Open menu" })

-- Audio
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("amixer sset Master toggle"),
	{ locked = true, repeating = true, description = "Mute audio" }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("amixer sset Capture toggle"),
	{ locked = true, repeating = true, description = "Mute microphone" }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("amixer sset Master 5%- unmute"),
	{ locked = true, repeating = true, description = "Lower volume" }
)

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("amixer sset Master 5%+ unmute"),
	{ locked = true, repeating = true, description = "Raise volume" }
)

hl.bind(
	"SHIFT + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("amixer sset Capture 5%- unmute"),
	{ locked = true, repeating = true, description = "Lower microphone volume" }
)

hl.bind(
	"SHIFT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("amixer sset Capture 5%+ unmute"),
	{ locked = true, repeating = true, description = "Raise microphone volume" }
)

local player = "ElectronNCM"
-- local player = "`playerctl -l | grep musicfox`"

-- hl.bind("XF86AudioPlay",
--     hl.dsp.exec_cmd("playerctl -p " .. player .. " play-pause"),
--     { description = "Play/pause audio" })

-- hl.bind("XF86AudioPrev",
--     hl.dsp.exec_cmd("playerctl -p " .. player .. " previous"),
--     { description = "Previous track" })

-- hl.bind("XF86AudioNext",
--     hl.dsp.exec_cmd("playerctl -p " .. player .. " next"),
--     { description = "Next track" })

-- Brightness
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl set 5%-"),
	{ locked = true, repeating = true, description = "Decrease brightness" }
)

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl set 5%+"),
	{ locked = true, repeating = true, description = "Increase brightness" }
)

-- Screen capture
hl.bind("PRINT", hl.dsp.exec_cmd("~/.config/Script/screen_cut.py"), { description = "Take a screenshot" })

hl.bind(
	"XF86Favorites",
	hl.dsp.exec_cmd("feh `cat ~/Pictures/Capture/.cache`"),
	{ description = "Open latest capture" }
)

-- Move focus with mainMod + arrow keys
-- hl.bind(mainMod .. " + left",
--     hl.dsp.focus({ direction = "left" }),
--     { description = "Move focus left" })

-- hl.bind(mainMod .. " + right",
--     hl.dsp.focus({ direction = "right" }),
--     { description = "Move focus right" })

-- hl.bind(mainMod .. " + up",
--     hl.dsp.focus({ direction = "up" }),
--     { description = "Move focus up" })

-- hl.bind(mainMod .. " + down",
--     hl.dsp.focus({ direction = "down" }),
--     { description = "Move focus down" })

-- Resize windows
-- hl.bind(mainMod .. " + ALT + right",
--     hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
--     { description = "Increase window width" })

-- hl.bind(mainMod .. " + ALT + left",
--     hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
--     { description = "Decrease window width" })

-- hl.bind(mainMod .. " + ALT + up",
--     hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
--     { description = "Decrease window height" })

-- hl.bind(mainMod .. " + ALT + down",
--     hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
--     { description = "Increase window height" })

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
	local key = (i % 10)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Focus workspace " .. i })

	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move window to workspace " .. i }
	)
end

-- Special workspace 10 key binding
hl.bind("SHIFT + CTRL + code:93", hl.dsp.focus({ workspace = 10 }), { description = "Focus workspace 10" })

hl.bind("ALT + TAB", hl.dsp.focus({ workspace = "previous" }), { description = "Switch to previous workspace" })

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle special workspace magic" })

hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.window.move({ workspace = "special:magic" }),
	{ description = "Move window to special workspace magic" }
)

-- Special workspace game
-- hl.bind(mainMod .. " + G",
--     hl.dsp.workspace.toggle_special("game"),
--     { description = "Toggle special workspace game" })

-- hl.bind(mainMod .. " + SHIFT + G",
--     hl.dsp.window.move({ workspace = "special:game" }),
--     { description = "Move window to special workspace game" })

-- Special workspace proxy
hl.bind(mainMod .. " + P", hl.dsp.workspace.toggle_special("proxy"), { description = "Toggle special workspace proxy" })

hl.bind(
	mainMod .. " + SHIFT + P",
	hl.dsp.window.move({ workspace = "special:proxy" }),
	{ description = "Move window to special workspace proxy" }
)

-- Workspace 20
hl.bind(mainMod .. " + H", hl.dsp.focus({ workspace = 20 }), { description = "Focus workspace 20" })

hl.bind(
	mainMod .. " + SHIFT + H",
	hl.dsp.window.move({ workspace = 20 }),
	{ description = "Move window to workspace 20" }
)

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down",
--     hl.dsp.focus({ workspace = "e+1" }),
--     { description = "Switch to next workspace" })

-- hl.bind(mainMod .. " + mouse_up",
--     hl.dsp.focus({ workspace = "e-1" }),
--     { description = "Switch to previous workspace" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window with the mouse" })

hl.bind(
	mainMod .. " + mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true, description = "Resize window with the mouse" }
)

-- Scrolling layout setting
hl.bind(mainMod .. " + mouse_up", hl.dsp.layout("colresize +0.04"), { description = "Increase column size" })

hl.bind(mainMod .. " + mouse_down", hl.dsp.layout("colresize -0.04"), { description = "Decrease column size" })

hl.bind(
	"SHIFT + ALT + up",
	hl.dsp.layout("colresize +conf"),
	{ description = "Increase column size by configured amount" }
)

hl.bind(
	"SHIFT + ALT + down",
	hl.dsp.layout("colresize -conf"),
	{ description = "Decrease column size by configured amount" }
)

hl.config({
	binds = {
		scroll_event_delay = 0,
	},
})

hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "scroll_move",
	scale = 0.9,
})
