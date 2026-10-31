-- Charm After Dark: subtle glass, sharp text, and restrained curves.
hl.config({
  decoration = {
    rounding = 6,
    blur = { enabled = true, size = 4, passes = 2 },
    shadow = { enabled = true, range = 12, render_power = 3, color = "rgba(00000030)" },
  },
})
hl.layer_rule({ match = { namespace = "omarchy-bar" }, blur = true, ignore_alpha = 0.1 })
-- Native terminal background alpha keeps glyphs fully opaque.
o.window("^(Alacritty|kitty|foot|footclient|com\\.mitchellh\\.ghostty)$", { opacity = "1 1" })

-- Charm After Dark: short horizontal workspace slide with a soft fade.
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.2, bezier = "easeOutQuint", style = "slidefade 20%" })
