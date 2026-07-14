-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- treesitter fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.sessionoptions = "buffers,curdir,folds,help,winsize,globals,skiprtp"
