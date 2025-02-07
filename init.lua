-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")
-- require("lsp.null-ls")
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.cmd("autocmd BufRead,BufWritePre * setlocal fileformat=unix")
