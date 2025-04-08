-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.python3_host_prog = "~/.config/nvim/.venv/bin/python"

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false
})

vim.keymap.set("n", "<leader>l", function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config, virtual_text = not new_config })
end, { desc = "Toggle diagnostic virtual_lines" })

local opt = vim.opt
opt.number = true
opt.cursorline = true
opt.undofile = true
opt.undolevels = 10000
opt.termguicolors = true
opt.encoding = "UTF-8"
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.termguicolors = true

local wo = vim.wo
wo.wrap = false

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(event)
    require("notify")("Hello")
    vim.cmd("setlocal filetype=hyprlang")
  end,
})

-- stylua: ignore
local keymaps = function()
  vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
  vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
  vim.keymap.set("n", "K", function() return vim.lsp.buf.hover() end, { desc = "Hover" })
  vim.keymap.set("n", "gK", function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
  vim.keymap.set("i", "<c-k>", function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
  vim.keymap.set({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
  vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
  vim.keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
end

keymaps()

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "gruvbox-material" } },
  checker = { enabled = true },
})
