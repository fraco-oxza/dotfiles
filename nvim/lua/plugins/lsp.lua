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

        rust_analyzer = function()
          local capabilities = require("blink.cmp").get_lsp_capabilities()
          require("lspconfig").rust_analyzer.setup({
            capabilites = capabilities,
            on_attach = function(client, bufnr)
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy",
                },
                runnables = {
                  use_telescope = true,
                },
              },
            },
          })
        end,
      })
    end,
    -- stylua: ignore
  },
}
