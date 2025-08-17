return {
  {
    "echasnovski/mini.ai",
    event = "InsertEnter",
    opts = {
      search_method = "cover_or_nearest",
    }
  },
  { "echasnovski/mini.comment",  event = "InsertEnter", opts = {} },
  { "echasnovski/mini.surround", event = "InsertEnter", opts = {} },
  { "echasnovski/mini.files",    opts = {},             keys = { { "<leader>mf", "<cmd>lua MiniFiles.open()<cr>" } } },
}
