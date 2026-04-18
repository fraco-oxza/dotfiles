return {
  hostname = "thopter",
  type = "laptop",
  
  monitors = {
    {
      output   = "eDP-1",
      mode     = "1920x1200@60",
      position = "auto",
      scale    = 1.25,
    },
  },
  
  nvidia = false,
  
  kb_layout = "latam",
  
  autostart = {
    "waybar & hyprpaper",
    "nm-applet & blueman-applet",
    "wl-paste --type text --watch cliphist store",
    "wl-paste --type image --watch cliphist store",
    "udiskie",
    "swaync",
    "gnome-keyring-daemon --start",
    "swayosd-server",
    "hypridle",
    "hyprsunset",
  },
  
  volume_cmd = "swayosd",
}
