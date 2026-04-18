local host = require("lua.host")

hl.on("hyprland.start", function()
  for _, cmd in ipairs(host.autostart) do
    hl.exec_cmd(cmd)
  end
end)
