hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.8 }, { 0.1, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "myBezier", style = "popin 70%" })

hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "myBezier", style = "popin 80%" })

hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "myBezier" })

hl.animation({ leaf = "borderangle", enabled = true, speed = 3, bezier = "myBezier" })

hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "myBezier" })

hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "myBezier", style = "fade" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "myBezier", style = "slidefadevert 20%" })
