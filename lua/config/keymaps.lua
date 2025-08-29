-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Position cursor at the middle of the screen after scrolling half page
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down half a page and center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up half a page and center the cursor

-- Map Ctrl+b in insert mode to delete to the end of the word without leaving insert mode
vim.keymap.set("i", "<C-b>", "<C-o>de")

-- Screen Keys
vim.keymap.set({ "n" }, "<leader>uk", "<cmd>Screenkey<CR>")

----- OBSIDIAN -----
vim.keymap.set(
  "n",
  "<leader>oc",
  "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
  { desc = "Obsidian Check Checkbox" }
)
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insertar Plantilla de Obsidian" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Abrir en la App Obsidian" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Mostrar Backlinks de Obsidian" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Mostrar Links de Obsidian" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Crear Nueva Nota" })
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianSearch<CR>", { desc = "Buscar en Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Cambio Rápido" })

----- OIL -----
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Eliminar todos los buffers excepto el actual
vim.keymap.set("n", "<leader>bq", '<Esc>:%bdelete|edit #|normal`"<Return>', {
  desc = "Eliminar otros buffers excepto el actual",
})

-- Keymaps para formatear el código
-- vim.api.nvim_set_keymap("n", "+", ":lua vim.lsp.buf.format({async = true})<CR>", { noremap = true, silent = true })

--Entrar en modo visual de bloque
vim.api.nvim_set_keymap("n", "<C-b>", "<C-v>", { noremap = true, silent = true })

-- Redefine Ctrl+s to save with the custom function
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })

-- Custom save function
function SaveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("Archivo no guardado", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Guardado!") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end

-- Abrir el menú de opciones con Ctrl+t
vim.keymap.set("n", "<leader>m", function()
  require("menu").open("default")
end, { desc = "Abrir el menú de opciones" })

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
