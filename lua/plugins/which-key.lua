return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.add({
      { "<leader>o", group = "Obsidian", icon = { icon = "  ", color = "purple" } },
      { "<leader>b", group = "Buffers", icon = { icon = "  ", color = "blue" } },
      { "<leader>c", group = "Code", icon = { icon = "󰅱  ", color = "red" } },
      { "<leader>f", group = "Workspace", icon = { icon = "󰱼 ", color = "cyan" } },
      { "<leader>g", group = "Git", icon = { icon = "󰊢  ", color = "cyan" } },
      { "<leader>q", group = "Sesions", icon = { icon = "  ", color = "cyan" } },
      { "<leader>r", group = "SQL", icon = { icon = "  ", color = "yellow" } },
      { "<leader>R", group = "Rest", icon = { icon = "  ", color = "orange" } },
      { "<leader>s", group = "Search", icon = { icon = "󱁴  ", color = "blue" } },
      { "<leader>u", group = "UI", icon = { icon = "󱥇  ", color = "green" } },
      { "<leader>w", group = "Windows", icon = { icon = "  ", color = "purple" } },
      { "<leader>x", group = "Quickfix", icon = { icon = "󰙅  ", color = "grey" } },
      { "<leader><Tab>", group = "Tabs", icon = { icon = "󰓩  ", color = "red" } },
    })
  end,
}
