return {
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    version = "*",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
    config = function()
      require("mini.pairs").setup()
    end,
  },
  { "echasnovski/mini.ai", event = "InsertEnter", opts = {
    search_method = "cover_or_nearest",
  } },
  { "echasnovski/mini.comment", event = "InsertEnter", opts = {} },
  { "echasnovski/mini.surround", event = "InsertEnter", opts = {} },
  { "echasnovski/mini.files", opts = {}, keys = { { "<leader>mf", "<cmd>lua MiniFiles.open()<cr>" } } },
}
