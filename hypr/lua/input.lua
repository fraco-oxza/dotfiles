local host = require("lua.host")

hl.config({
  input = {
    kb_layout    = host.kb_layout,
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",

    follow_mouse = 1,

    sensitivity  = 0,

    touchpad     = {
      natural_scroll = false,
    },
  },
})
