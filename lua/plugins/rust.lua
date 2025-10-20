local dap = require("dap")

local codelldb_path =
  "C:\\Users\\lmasapanta\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\extension\\adapter\\codelldb.exe"

dap.adapters.codelldb = {
  type = "server",
  host = "127.0.0.1",
  port = "${port}", -- puedes generar dinámico como te mostré antes
  executable = {
    command = codelldb_path,
    args = { "--port", "${port}" },
  },
}

return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  opts = {
    server = {
      settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          procMacro = {
            enable = true,
            ignored = {
              -- ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
      },
    },
  },
}
