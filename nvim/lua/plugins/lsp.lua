return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim", lazy = false },
      "neovim/nvim-lspconfig",
    },
    opts = { automatic_installation = true },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local capabilities = require("blink.cmp").get_lsp_capabilities()
          require("lspconfig")[server_name].setup({ capabilites = capabilities })
        end,
      })
    end,
  },
}
