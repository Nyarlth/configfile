-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keys = vim.keymap
keys.set("n", "<leader>q", "<cmd>q<cr>")
keys.set("i", "jj", "<Escape>")
keys.set("n", "<tab>", "<cmd>bn<cr>")

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

local keymap = vim.keymap.set
local tb = require("telescope.builtin")
local opts = { noremap = true, silent = true }

function vim.lg()
  local text = vim.getVisualSelection()
  tb.live_grep({ default_text = text })
  --  vim.cmd("<Escape>")
end

keymap("n", "<space>g", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("v", "<space>g", function()
  local text = vim.getVisualSelection()
  tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

keymap("n", "<menu>", ":Telescope live_grep<cr>", opts)
keymap("v", "/", "<cmd>lua vim.lg()<cr><Escape>", opts)
