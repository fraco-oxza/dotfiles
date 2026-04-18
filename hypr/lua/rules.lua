-- WINDOWS AND WORKSPACES RULES
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Ignore maximize requests from all apps.
hl.window_rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})

-- Highlight fullscreen windows with a distinct border color
hl.window_rule({
  match = { fullscreen = true },
  border_color = "rgb(c35e0a)",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

-- Enable tearing / immediate rendering for mpv
hl.window_rule({
  match = { class = "mpv" },
  immediate = true,
})
