-- This is a migrated Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Add current config directory to package.path dynamically
local current_file_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
if current_file_dir then
  package.path = current_file_dir .. "?.lua;" .. package.path
end

-- Load host-specific configuration
local host = require("lua.host")

-- Import modules
require("lua.monitors")
require("lua.autostart")
require("lua.env")
require("lua.look")
require("lua.input")
require("lua.binds")
require("lua.rules")
