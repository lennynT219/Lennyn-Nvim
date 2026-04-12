return {
  "bngarren/checkmate.nvim",
  ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
  keys = { -- Atajo para abrir el todo.md del proyecto en una ventana flotante
    {
      "<leader>t",
      function()
        -- Define el tamaño de la ventana (70% de la pantalla)
        local width = math.floor(vim.o.columns * 0.7)
        local height = math.floor(vim.o.lines * 0.7)

        -- Añade o carga el archivo todo.md de la raíz del proyecto
        local buf = vim.fn.bufadd("TODO.md")
        vim.fn.bufload(buf)
        vim.api.nvim_set_option_value("filetype", "markdown", { buf = buf })

        -- Abre la ventana flotante centrada
        vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width = width,
          height = height,
          col = math.floor((vim.o.columns - width) / 2),
          row = math.floor((vim.o.lines - height) / 2),
          style = "minimal",
          border = "rounded",
        })
      end,
      desc = "Abrir todo.md del proyecto",
    },
  },
  opts = {
    -- files = { "*.md" }, -- any .md file (instead of defaults)
  },
}
