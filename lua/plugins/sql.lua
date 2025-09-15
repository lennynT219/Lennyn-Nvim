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
      -- Buscar archivo .sqls.yml en el directorio actual o superiores
      local function find_sqls_config()
        local current_dir = vim.fn.getcwd()
        local config_file = current_dir .. "/.sqls.yml"

        if vim.fn.filereadable(config_file) == 1 then
          return config_file
        end

        local parent_dir = vim.fn.fnamemodify(current_dir, ":h")
        while parent_dir ~= current_dir do
          config_file = parent_dir .. "/.sqls.yml"
          if vim.fn.filereadable(config_file) == 1 then
            return config_file
          end
          current_dir = parent_dir
          parent_dir = vim.fn.fnamemodify(current_dir, ":h")
        end

        return nil
      end

      local config_file = find_sqls_config()

      if config_file then
        vim.lsp.config("sqls", {
          cmd = { "sqls", "-config", config_file },
        })
      else
        vim.lsp.config("sqls", {})
      end

      vim.lsp.enable("sqls")
    end,
    keys = {
      { "<leader>r", "", desc = "󰆼 SQL", mode = { "n", "v" } },
      { "<leader>re", ":SqlsExecuteQuery<cr>", desc = "󰐊 Ejecutar consulta", mode = "n" },
      { "<leader>re", ":SqlsExecuteQuery<cr>", desc = "󰐊 Ejecutar seleccion", mode = "v" },
      { "<leader>rv", "<cmd>SqlsExecuteQueryVertical<cr>", desc = "󰯅 Ejecutar (vertical)" },
      {
        "<leader>rf",
        function()
          vim.cmd("normal! ggVG")
          vim.cmd("SqlsExecuteQuery")
        end,
        desc = "󰈔 Ejecutar archivo",
      },
      {
        "<leader>rl",
        function()
          vim.cmd("normal! V")
          vim.cmd("SqlsExecuteQuery")
        end,
        desc = "󰐊 Ejecutar línea",
      },
      {
        "<leader>rp",
        function()
          vim.cmd("normal! vip")
          vim.cmd("SqlsExecuteQuery")
        end,
        desc = "󰅪 Ejecutar párrafo",
      },
      { "<leader>rc", "<cmd>SqlsShowConnections<cr>", desc = "󰛳 Ver conexiones" },
      { "<leader>rC", "<cmd>SqlsSwitchConnection<cr>", desc = "󰓁 Cambiar conexión" },
      { "<leader>rd", "<cmd>SqlsShowDatabases<cr>", desc = "󰆼 Ver databases" },
      { "<leader>rD", "<cmd>SqlsSwitchDatabase<cr>", desc = "󰓁 Cambiar database" },
      { "<leader>rs", "<cmd>SqlsShowSchemas<cr>", desc = "󰙅 Ver esquemas" },
      { "<leader>rt", "<cmd>SqlsShowTables<cr>", desc = "󰓫 Ver tablas" },
      { "<leader>rT", "<cmd>SqlsDescribeTable<cr>", desc = "󰓮 Describir tabla" },
      {
        "<leader>rr",
        function()
          vim.lsp.buf.format()
        end,
        desc = "󰉠 Formatear SQL",
      },
      { "<leader>rq", "<cmd>pclose<cr>", desc = "󰅖 Cerrar resultados" },
      { "<leader>ro", "<cmd>SqlsShowSchemas<cr>:SqlsShowTables<cr>", desc = "󰔶 Overview DB" },
    },
  },
}
