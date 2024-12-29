return {
  "folke/snacks.nvim",
  dependencies = { "rcarriga/nvim-notify" },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
  },
}
