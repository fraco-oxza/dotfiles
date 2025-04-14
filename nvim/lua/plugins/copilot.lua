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
        yaml = true,
        sql = true,
      },
    },
  },
}
