return {
  { "williamboman/mason.nvim", lazy = false, opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp", "williamboman/mason-lspconfig.nvim" },

    opts = {
      servers = {
        hyprls = {},
        astro = {},
        eslint = {},
        lua_ls = {},
        rust_analyzer = {},
        gopls = {},
        buf_ls = {},
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
        cssls = {},
        html = {},
        ts_ls = {},
        jdtls = {},
        pyright = {},
        texlab = {}
      },
    },

    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = { automatic_installation = true },
  },
}
