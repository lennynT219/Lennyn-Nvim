local wk = require("which-key")

-- Position cursor at the middle of the screen after scrolling half page
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down half a page and center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up half a page and center the cursor

-- Map Ctrl+b in insert mode to delete to the end of the word without leaving insert mode
vim.keymap.set("i", "<C-b>", "<C-o>de")

vim.keymap.set({ "i", "n", "v" }, "<C-c>", [[<C-\><C-n>]])

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
vim.keymap.set("n", ";", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Eliminar todos los buffers excepto el actual
vim.keymap.set("n", "<leader>bq", '<Esc>:%bdelete|edit #|normal`"<Return>', {
  desc = "Eliminar otros buffers excepto el actual",
})

--Entrar en modo visual de bloque
vim.api.nvim_set_keymap("n", "<C-b>", "<C-v>", { noremap = true, silent = true })

-- Abrir el menú de opciones con  Ctrl+t
wk.add({
  {
    "<leader>m",
    function()
      return require("menu").open("default")
    end,
    desc = "Menú de opciones",
    icon = { icon = "󰹯  ", color = "azure" },
  },
})

----- Navegación -----
-- Esto te permitirá moverte entre paneles de código divididos usando CTRL + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir al panel izquierdo", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir al panel inferior", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir al panel superior", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir al panel derecho", remap = true })

-- Ajustar tamaño de los paneles usando CTRL + flechas (opcional, pero muy útil)
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Aumentar altura del panel" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Disminuir altura del panel" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Disminuir anchura del panel" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Aumentar anchura del panel" })
