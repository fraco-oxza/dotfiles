local function get_hostname()
  local f = io.popen("cat /etc/hostname 2>/dev/null || hostname 2>/dev/null || echo 'unknown'")
  if f then
    local hostname = f:read("*l")
    f:close()
    return hostname and hostname:match("^%s*(.-)%s*$") or "unknown"
  end
  return "unknown"
end

local hostname = get_hostname()

local ok, host_config = pcall(require, "lua.hosts." .. hostname)
if not ok then
  print("Warning: No host config found for '" .. hostname .. "', using caladan as default")
  host_config = require("lua.hosts.caladan")
end

return host_config
