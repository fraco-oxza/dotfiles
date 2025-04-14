return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
  opts = {
    sections = {
      lualine_x = {
        {
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          color = { fg = "#ff9e64" },
        },
        "encoding",
        "fileformat",
        "filetype",
      },
    },
    options = { theme = "gruvbox-material" },
  },
}
