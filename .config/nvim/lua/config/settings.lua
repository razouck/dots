
local c                      = vim.cmd
local g                      = vim.g
local o                      = vim.o

-- Colors
o.background                 = "light" -- Set light background.
o.pumblend                   = 21      -- Enable transparency in popup menus.
o.termguicolors              = true    -- Enable true terminal colors.

-- Cursor
o.cursorcolumn               = true    -- Highlight cursor column.
o.cursorline                 = true    -- Highlight cursor line.
o.guicursor                  = ""      -- Always use the block cursor.

-- Indentation
g.markdown_recommended_style = 0       -- Disallow overriding from Markdown.
g.python_recommended_style   = 0       -- Disallow overriding from Python.
o.expandtab                  = false   -- Use tabs only.
o.shiftwidth                 = 4       -- Set tab size.
o.smartindent                = true    -- New lines automatically indented.
o.softtabstop                = 0       -- Don't move by spaces with <Tab>.
o.tabstop                    = 4       -- <Tab> inserts 4 spaces.

-- Line wrapping
o.wrap                       = false   -- Disable line wrapping.

-- Mouse
o.mouse                      = "a"     -- Always allow mouse usage.
c([[aunmenu PopUp.How-to\ disable\ mouse]])
c([[aunmenu PopUp.-1-]])               -- Disable useless pop up menu option.

-- Numbers
o.number                     = true    -- Show the current line number.
o.relativenumber             = true    -- Enable relative numbering of lines.

-- Rulers
o.colorcolumn                = "81"    -- Draw a ruler.

-- Search
o.incsearch                  = true    -- Live search pattern matching.
o.ignorecase                 = true    --  Ignore upper case when searching
o.smartcase                  = true    --+ with lower case; don't otherwise.

-- Splits
o.splitbelow                 = true    -- Put new view below the current one.
o.splitright                 = true    -- Put new view to the right.

-- Start Message
o.shortmess                  = o.shm.."I" -- Disable Intro message.

-- Undo
o.undofile                   = true    -- Save undo history for later usage.
o.undolevels                 = 10000   -- Set maximum amount of undos.
