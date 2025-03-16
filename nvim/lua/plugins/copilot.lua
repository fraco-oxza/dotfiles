return {
  {
    "zbirenbaum/copilot.lua",
    event = "BufRead",
    cmd = "Copilot",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
      filetypes = {
        markdown = true,
      },
    },
  },
  { "AndreM222/copilot-lualine" },
}
