return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        accept_word = "<C-l>",
      },
      disable_inline_completion = false,
      disable_keymaps = false,
      ignore_filetypes = {
        "bigfile",
        "snacks_input",
        "snacks_notif",
        "TelescopePrompt",
        "NvimTree",
        "lazy",
        "mason",
      },
      log_level = "warn",
      color = {
        suggestion_color = "#8babf0",
        cterm = 225,
      },
    })
  end,
}
