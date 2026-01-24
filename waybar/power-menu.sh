#!/usr/bin/env bash

suspend="󰒲  Suspender"
reboot="󰑐  Reiniciar"
shutdown="󰐥  Apagar"
logout="󰍃  Cerrar sesión"
lock="󰌾  Bloquear"

css=$(mktemp /tmp/wofi-power-XXXX.css)
cat > "$css" <<'EOF'
* {
  font-family: "Overpass";
  font-size: 13px;
}
window {
  background-color: #1d2021;
  border: 2px solid #3c3836;
  border-radius: 12px;
}
#input {
  background-color: #3c3836;
  color: #a89984;
  border: none;
  border-radius: 8px;
  margin: 8px;
  padding: 6px 10px;
}
#inner-box {
  background-color: transparent;
  margin: 0 6px 6px 6px;
}
#outer-box {
  background-color: transparent;
}
#entry {
  background-color: transparent;
  border-radius: 8px;
  padding: 6px 10px;
  color: #ebdbb2;
}
#entry:selected {
  background-color: #3c3836;
  color: #fabd2f;
}
EOF

chosen=$(printf '%s\n' "$suspend" "$reboot" "$shutdown" "$logout" "$lock" | wofi \
  --dmenu \
  --prompt "  Energía" \
  --width 220 \
  --height 230 \
  --cache-file /dev/null \
  --style "$css")

rm -f "$css"

case "$chosen" in
  "$suspend")  systemctl suspend ;;
  "$reboot")   systemctl reboot ;;
  "$shutdown") systemctl poweroff ;;
  "$logout")   hyprctl dispatch exit ;;
  "$lock")     hyprlock ;;
esac
