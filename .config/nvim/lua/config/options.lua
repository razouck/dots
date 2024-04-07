-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.o
local opt = vim.opt

opt.colorcolumn = "81"

-- Cursor
opt.cursorcolumn = true
opt.cursorline = true

-- Line Numbers
opt.relativenumber = true

-- Indentation
o.noexpandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = false
opt.autoindent = false
opt.smartindent = false

-- Neovide
if vim.g.neovide then
	o.background = "light"
	o.guifont = "MartianMono Nerd Font:h10"
end
