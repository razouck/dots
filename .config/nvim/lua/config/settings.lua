local g                      = vim.g
local opt                    = vim.opt

opt.background               = "light"  -- Set light background.
opt.pumblend                 = 30       -- Enable transparency in popup menus.
opt.termguicolors            = true     -- Enable true terminal colors.

opt.cursorcolumn             = true     -- Highlight cursor column.
opt.cursorline               = true     -- Highlight cursor line.
opt.guicursor                = ""       -- Always use a fat cursor.

g.mapleader                  = " "      -- Set spacebar as <leader> key.
g.maplocalleader             = "\\"

g.markdown_recommended_style = 0        -- Allow tabs to be used in Markdown.
g.python_recommended_style   = 0        -- Allow tabs to be used in Python.
opt.expandtab                = false    -- Use tabs only.
opt.shiftwidth               = 4        -- Set tab size.
opt.smartindent              = true     -- Enable smart indentation.
opt.softtabstop              = 0        -- Don't move with spaces with <Tab>.
opt.tabstop                  = 4        -- Amount of spaces inserted by tabs.

opt.mouse                    = "a"      -- Always allow mouse usage.

opt.number                   = true     -- Show the current line number.
opt.relativenumber           = true     -- Enable relative numbering of lines.

opt.colorcolumn              = "81,120" -- Draw two rulers.

opt.incsearch                = true     -- Live search pattern matching.

opt.splitbelow               = true     -- Put new window below the current one.
opt.splitright               = true     -- Put new window to the right.

opt.undofile                 = true     -- Save undo history for later usage.
opt.undolevels               = 10000    -- Set maximum amount of undos.

opt.wrap                     = false    -- Disable line wrapping.
