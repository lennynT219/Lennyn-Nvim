return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.sqlfluff.with({
          extra_args = { "--dialect", "tsql" },
        }),
      },
    })
    vim.keymap.set("n", "+", vim.lsp.buf.format, {})
  end,
}
