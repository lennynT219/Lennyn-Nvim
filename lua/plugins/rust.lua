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

return {}
