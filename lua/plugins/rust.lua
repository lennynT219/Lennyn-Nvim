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
