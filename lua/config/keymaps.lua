-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Disable <ctrl> hjkl window navigation
vim.keymap.set("n", "<C-h>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<Nop>", { noremap = true, silent = true })

local utils = require("config.utils")

-- First remove any existing Ctrl+L mappings
pcall(vim.keymap.del, "n", "<C-l>")
pcall(vim.keymap.del, "v", "<C-l>")

-- Set up the new mapping
vim.keymap.set({ "n", "v" }, "<C-l>", function()
  utils.recenter_top_bottom()
end, { noremap = true, silent = true, desc = "Cycle line position (center/top/bottom)" })

-- zz like za
vim.keymap.set("n", "zz", "za", { desc = "Toggle fold" })
