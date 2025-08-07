-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.tex", -- 匹配 .tex 文件
  command = "set filetype=tex", -- 设置文件类型为 tex
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.tex", -- 匹配 .tex 文件
  command = "set filetype=tex", -- 设置文件类型为 tex
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.cmd("highlight clear SpellBad") -- 清除拼写检查的高亮
    vim.cmd("set wrap")
  end,
})
