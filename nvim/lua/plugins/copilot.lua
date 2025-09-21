return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp"
    },
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      suggestion = {
        auto_trigger = false,
      },
      filetypes = {
        markdown = true,
        yaml = true,
        sql = true,
      },
    },
  },
}
