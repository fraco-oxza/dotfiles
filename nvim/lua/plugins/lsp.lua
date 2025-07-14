return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp", "williamboman/mason-lspconfig.nvim" },

    opts = {
      servers = {
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
      },
    },

    config = function(_, opts)
      local blink = require("blink.cmp")
      for server, config in pairs(opts.servers) do
        config.capabilities = blink.get_lsp_capabilities(config.capabilities)
        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "astro",
        "gopls",
        "lua_ls",
        "pyright",
        "jdtls",
        "hyprls",
        "cssls",
        "html",
        "ts_ls",
        "texlab",
        "rust_analyzer",
      },
    },
  },
}
