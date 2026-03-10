return {
  "nvim-java/nvim-java",
  config = function()
    require("java").setup()
    vim.lsp.enable("jdtls")
  end,
  -- dependencies = {
  --   {
  --     "neovim/nvim-lspconfig",
  --     opts = {
  --       servers = {
  --         jdtls = {
  --           -- Your custom jdtls settings goes here
  --         },
  --       },
  --       setup = {
  --         jdtls = function()
  --           require("java").setup({
  --             jdk = {
  --               auto_install = false,
  --             },
  --           })
  --         end,
  --       },
  --     },
  --   },
  -- },
}
