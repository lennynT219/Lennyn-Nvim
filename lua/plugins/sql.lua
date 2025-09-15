return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
      },
    },
    formatters = {
      sql_formatter = {
        command = "sql-formatter",
        args = { "--fix" },
        stdin = true,
      },
    },
  },
  {
    "nanotee/sqls.nvim",
    ft = { "sql" },
    config = function()
      vim.lsp.config("sqls", {})
      vim.lsp.enable("sqls")
    end,
  },
}
