local host = require("lua.host")

for _, monitor in ipairs(host.monitors) do
  hl.monitor(monitor)
end

hl.monitor({
  output = "",
  mode = "highres",
  position = "auto",
  scale = "auto"
})
