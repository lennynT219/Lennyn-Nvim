-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.lazyvim_prettier_needs_config = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Alternar entre diccionarios
vim.api.nvim_create_user_command("SpellToggle", function()
  if vim.opt.spelllang:get()[1] == "en" then
    vim.opt.spelllang = { "es" }
  else
    vim.opt.spelllang = { "en" }
  end
end, {})

vim.api.nvim_create_user_command("SpellAll", function()
  vim.opt.spelllang = { "en", "es" }
end, {})
