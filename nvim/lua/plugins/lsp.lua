return {
  { "williamboman/mason.nvim", lazy = false, opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp", "williamboman/mason-lspconfig.nvim" },

    opts = {
      servers = {
        angularls = {},
        astro = {},
        lua_ls = {},
        rust_analyzer = {},
        gopls = {},
        clangd = {},
        cssls = {},
        html = {},
        ts_ls = {},
        jdtls = {},
        pyright = {},
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
