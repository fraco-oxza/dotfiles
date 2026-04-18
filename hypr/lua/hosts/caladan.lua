return {
  hostname = "caladan",
  type = "desktop",
  
  monitors = {
    {
      output   = "HDMI-A-1",
      mode     = "1920x1080@60",
      position = "0x100",
      scale    = 1,
    },
    {
      output   = "DP-1",
      mode     = "2560x1440@144",
      position = "1920x0",
      scale    = 1.25,
      bitdepth = 10,
    },
  },
  
  nvidia = true,
  
  kb_layout = "es",
  
  autostart = {
    "waybar & hyprpaper",
    "nm-applet & blueman-applet",
    "wl-paste --type text --watch cliphist store",
    "wl-paste --type image --watch cliphist store",
    "udiskie",
    "swaync",
    "gnome-keyring-daemon --start",
    "hypridle",
  },
  
  volume_cmd = "wpctl",
}
