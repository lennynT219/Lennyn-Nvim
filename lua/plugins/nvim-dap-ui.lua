return {
  { "nvim-neotest/nvim-nio" },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "repl", size = 0.2 },
              { id = "console", size = 0.8 },
            },
            position = "bottom",
            size = 10, -- Ajusta el tamaño del panel inferior si es necesario
          },
        },
        controls = {
          enabled = true,
        },
      })

      dap.listeners.before.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    end,
  },
}
