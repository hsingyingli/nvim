-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- New tab
keymap.set("n", "te", ":tabedit")
-- Tab 键仅在 normal 模式下切换标签页，insert 模式由补全插件处理
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
keymap.set("t", "sh", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
keymap.set("t", "sj", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
keymap.set("t", "sk", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
keymap.set("t", "sl", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })
