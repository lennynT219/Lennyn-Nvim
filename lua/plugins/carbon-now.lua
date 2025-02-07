return {
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true, -- Solo cargar cuando uses el comando
    cmd = "CarbonNow", -- El comando que activa el plugin
    opts = { -- Configuración personalizada
      options = {
        bg = "#ABB8C3",
        drop_shadow_blur = "68px",
        drop_shadow = false,
        drop_shadow_offset_y = "20px",
        font_family = "Cascadia Code",
        font_size = "15px",
        line_height = "133%",
        line_numbers = false,
        theme = "one-dark",
        titlebar = "",
        watermark = false,
        width = "680",
        width_adjust = true,
        window_theme = "none",
        padding_horizontal = "10px",
        padding_vertical = "10px",
      },
    },
  },
  vim.keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { silent = true }),
}
