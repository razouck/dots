local g                      = vim.g
local o                      = vim.o
local opt                    = vim.opt

-- Theme
opt.background               = "light"
opt.termguicolors            = true

-- Cursor
opt.cursorcolumn             = true
opt.cursorline               = true
opt.guicursor                = ""

-- Leader
g.mapleader                  = " "
g.maplocalleader             = "\\"

-- Line Numbers
opt.number                   = true
opt.relativenumber           = true

-- Indentation
o.noexpandtab                = true
opt.tabstop                  = 4
opt.shiftwidth               = 4
opt.softtabstop              = 0
opt.smartindent              = true
g.markdown_recommended_style = 0
g.python_recommended_style   = 0

-- Mouse
opt.mouse                    = "a"

-- Rulers
opt.colorcolumn              = "81,120"

-- Search
opt.incsearch                = true

-- Splits
opt.splitbelow               = true
opt.splitright               = true

-- Undo
opt.undofile                 = true
opt.undolevels               = 10000

-- Wrapping
opt.wrap                     = false
