vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<F2>", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<F2>", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
