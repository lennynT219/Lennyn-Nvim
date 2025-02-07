-- This file contains the configuration for various UI-related plugins in Neovim.

return {
  -- Plugin: noice.nvim
  -- URL: https://github.com/folke/noice.nvim
  -- Description: A Neovim plugin for enhancing the command-line UI.
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline", -- Use the cmdline view for the command-line
        },
        presets = {
          bottom_search = true, -- Enable bottom search view
          command_palette = true, -- Enable command palette view
          lsp_doc_border = true, -- Enable LSP documentation border
        },
        -- Uncomment the following lines to customize the cmdline popup view
        views = {
          cmdline_popup = {
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },
      })
    end,
  },

  -- Plugin: nvim-docs-view
  -- URL: https://github.com/amrbashir/nvim-docs-view
  -- Description: A Neovim plugin for viewing documentation.
  {
    "amrbashir/nvim-docs-view",
    lazy = true, -- Load this plugin lazily
    cmd = "DocsViewToggle", -- Command to toggle the documentation view
    opts = {
      position = "right", -- Position the documentation view on the right
      width = 60, -- Set the width of the documentation view
    },
  },

  -- Plugin: nvim-notify
  -- URL: https://github.com/rcarriga/nvim-notify
  -- Description: A fancy notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact", -- Use compact rendering for notifications
      background_colour = "#1a1b26", -- Set the background color for notifications
      timeout = 5000, -- Set the timeout for notifications (in milliseconds)
    },
  },

  -- Plugin: lualine.nvim
  -- URL: https://github.com/nvim-lualine/lualine.nvim
  -- Description: A blazing fast and easy to configure Neovim statusline plugin.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
    requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
    opts = {
      options = {
        theme = "tokyonight-night", -- Set the theme for lualine
        icons_enabled = true, -- Enable icons in the statusline
      },
      sections = {
        lualine_a = {
          {
            "mode", -- Display the current mode
            icon = "🤞🏽", -- Set the icon for the mode
          },
        },
      },
    },
  },

  -- Plugin: incline.nvim
  -- URL: https://github.com/b0o/incline.nvim
  -- Description: A Neovim plugin for showing the current filename in a floating window.
  {
    "b0o/incline.nvim",
    event = "BufReadPre", -- Load this plugin before reading a buffer
    priority = 1200, -- Set the priority for loading this plugin
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } }, -- Set the window margin
        hide = {
          cursorline = true, -- Hide the incline window when the cursorline is active
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename -- Indicate if the file is modified
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
          return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
        end,
      })
    end,
  },

  -- Plugin: mini.nvim
  -- URL: https://github.com/echasnovski/mini.nvim
  -- Description: A collection of minimal, fast, and modular Lua plugins for Neovim.
  {
    "echasnovski/mini.nvim",
    version = false, -- Use the latest version
    config = function()
      require("mini.animate").setup({
        resize = {
          enable = false, -- Disable resize animations
        },
        open = {
          enable = false, -- Disable open animations
        },
        close = {
          enable = false, -- Disable close animations
        },
        scroll = {
          enable = false, -- Disable scroll animations
        },
      })
    end,
  },

  -- Plugin: zen-mode.nvim
  -- URL: https://github.com/folke/zen-mode.nvim
  -- Description: A Neovim plugin for distraction-free coding.
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode", -- Command to toggle Zen Mode
    opts = {
      plugins = {
        gitsigns = true, -- Enable gitsigns integration
        tmux = true, -- Enable tmux integration
        kitty = { enabled = false, font = "+2" }, -- Disable kitty integration and set font size
        twilight = { enabled = true }, -- Enable twilight integration
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } }, -- Keybinding to toggle Zen Mode
  },

  -- Plugin: dashboard-nvim
  -- URL: https://github.com/nvimdev/dashboard-nvim
  -- Description: A Neovim plugin for creating a customizable dashboard.
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- Load this plugin immediately
    event = "VimEnter", -- Load this plugin on VimEnter event
    opts = function(_, opts)
      --     local logo = [[
      -- ██▒▒▒▒▒▒░░         ♡     ▒▒▒▒░  ♡  ████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░
      --  █▒▒▒▒▒▒░  ♡   ♡         ▒▒▒▒░     ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░
      --  █▒▒▒▒▒▒░          ♡   █▒▒▒▒  ♡    ▒▒▒▒░     ▒▒▒▒▒▒░  ♡  ▒▒▒▒░
      --  █▒▒▒▒▒▒░    ♡ ♡         ♡     ♡             ▒▒▒▒▒▒░  ♡  ▒▒▒▒░
      --  █▒▒▒▒▒▒░     ♡      ♡                  ♡    ▒▒▒▒▒▒░     ♡
      --  ▒▒▒▒▒▒▒░                   ♡    ♡           ▒▒▒▒▒▒░   ♡
      --  ▒▒▒▒▒▒▒░  ♡     ♡                  ♡        ▒▒▒▒▒▒░     ♡
      --  ▒▒▒▒▒▒▒░                ♡    ♡   ♡      ♡   ▒▒▒▒▒▒░  ♡
      --  ▒▒▒▒▒▒▒░ ♡      ♡                           ▒▒▒▒▒▒░      ♡
      --  ▒▒▒▒▒▒▒░           ▒▒░░   ♡  ♡      ♡       ▒▒▒▒▒▒░ ♡
      --  ▒▒▒▒▒▒▒░  ♡     ▒▒▒▒▒░░ ♡               ♡   ▒▒▒▒▒▒░  ♡
      -- ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░               ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░  ♡
      -- ▒▒▒▒▒░░░░░░░░░░░░░░░░░░░    ♡   ♡      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░
      -- ]]

      local logo = [[
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
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n" -- Add padding to the logo
      opts.config.header = vim.split(logo, "\n") -- Set the header for the dashboard

      opts.config.center = {
        {
          action = "lua LazyVim.pick()()",
          desc = " Buscar Archivos",
          icon = " ",
          key = "f",
        },
        {
          action = "ene | startinsert",
          desc = " Nuevo Archivo",
          icon = " ",
          key = "n",
        },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = " Archivos Recientes",
          icon = " ",
          key = "r",
        },
        {
          action = 'lua LazyVim.pick("live_grep")()',
          desc = " Buscar en Proyectos",
          icon = " ",
          key = "g",
        },
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Configuración",
          icon = " ",
          key = "c",
        },
        {
          action = 'lua require("persistence").load()',
          desc = " Restaurar Sesión",
          icon = " ",
          key = "s",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
        {
          action = "Lazy",
          desc = " Lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>qa<cr>")
          end,
          desc = " Salir",
          icon = " ",
          key = "q",
        },
      }

      opts.config.footer = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return { "⚡ Neovim cargo " .. stats.loaded .. "/" .. stats.count .. " plugins en " .. ms .. "ms" }
      end

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
    end,
  },
}
