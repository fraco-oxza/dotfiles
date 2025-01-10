return {
  {
    "zbirenbaum/copilot.lua",
    event = "BufRead",
    cmd = "Copilot",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
  },
  { "AndreM222/copilot-lualine" },
}
