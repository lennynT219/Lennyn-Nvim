return {
  {
    "folke/snacks.nvim",
    opts = {
      dim = {},
      image = {
        enabled = true,
        force = true,
        doc = {
          inline = false,
          float = true,
        },
      },
      picker = {
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          filename_bonus = true,
        },
        sources = {
          explorer = {
            matcher = {
              fuzzy = true, -- Enables fuzzy matching, so you can be a bit imprecise with your search terms
              smartcase = true, -- If your search term has uppercase letters, the search becomes case-sensitive
              ignorecase = true, -- Ignores case when searching, unless smartcase is triggered
              filename_bonus = true, -- Gives a higher priority to matches in filenames
              sort_empty = false, -- If no matches are found, it won't sort the results
            },
          },
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Mapeos de teclas", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Archivos recientes", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Proyectos", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = [[
     /\\\\\\\\                                         /\\\\\\\\\\\\\\\\\\\\          
 ___/\/\\\\\\\\______________        __/\\\\\_     ___/\/\\\\\\\\\\\\\\\\\\\\_        
  __\/\/\\\\\\\\______________        _\///\\\_     __\/\///////\\\\\\\\/////__       
   __\/\/\\\\\\\\______________        __/\\//__     __\///////\/\\\\\\\\///____      
    __\/\/\\\\\\\\______________        _\///____     ________\/\/\\\\\\\\_______     
     __\/\/\\\\\\\\______________        _________     ________\/\/\\\\\\\\_______    
      __\/\/\\\\\\\\\\\\\\\\\\\___        _________     ________\/\/\\\\\\\\_______   
       __\/\/\\\\\\\\\\\\\\\\\\\___        _________     ________\/\/\\\\\\\\_______  
        __\/\///////////////////____        _________     ________\/\////////________ 
         __\///////////////////______        _________     ________\////////__________
        ]],
          keys = {
            { icon = " ", key = "f", desc = "Buscar archivo", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "Nuevo archivo", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Buscar texto", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "r",
              desc = "Archivos recientes",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "c",
              desc = "Configuración",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restaurar sesión", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Salir", action = ":qa" },
          },
        },
      },
    },
  },
}
