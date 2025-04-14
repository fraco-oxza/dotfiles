return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope lsp references" })
    vim.keymap.set("n", "<leader>fic", builtin.lsp_incoming_calls, { desc = "Telescope lsp incoming calls" })
    vim.keymap.set("n", "<leader>foc", builtin.lsp_outgoing_calls, { desc = "Telescope lsp outgoing calls" })
  end,
}
