vim.cmd("au BufNewFile,BufRead *.frag setf glsl")
vim.cmd("au BufNewFile,BufRead *.frag lua require('lspconfig').glsl_analyzer.setup({})")
