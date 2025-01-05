return {
  {
    "echasnovski/mini.pairs",
    version = "*",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
    config = function(_, opts)
      require("mini.pairs").setup()
    end,
  },
  { "echasnovski/mini.ai", opts = {
    search_method = "cover_or_nearest",
  } },
  { "echasnovski/mini.comment", opts = {} },
  { "echasnovski/mini.surround", opts = {} },
  { "echasnovski/mini.files", opts = {}, keys = { { "<leader>mf", "<cmd>lua MiniFiles.open()<cr>" } } },
}
