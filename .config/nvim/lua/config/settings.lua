
local g                      = vim.g
local o                      = vim.o

-- Colors
o.background                 = "light" -- Set light background.
o.pumblend                   = 30      -- Enable transparency in popup menus.
o.termguicolors              = true    -- Enable true terminal colors.

-- Cursor
o.cursorcolumn               = true    -- Highlight cursor column.
o.cursorline                 = true    -- Highlight cursor line.
o.guicursor                  = ""      -- Always use the block cursor.

-- Indentation
g.markdown_recommended_style = 0       -- Allow tabs to be used in Markdown.
g.python_recommended_style   = 0       -- Allow tabs to be used in Python.
o.expandtab                  = false   -- Use tabs only.
o.shiftwidth                 = 4       -- Set tab size.
o.smartindent                = true    -- Enable smart indentation.
o.softtabstop                = 0       -- Don't move with spaces with <Tab>.
o.tabstop                    = 4       -- Amount of spaces inserted by tabs.

-- Line wrapping
o.wrap                       = false   -- Disable line wrapping.

-- Mouse
o.mouse                      = "a"     -- Always allow mouse usage.

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
o.shortmess                  = "filnxtToOI" -- Disable intro.

-- Undo
o.undofile                   = true    -- Save undo history for later usage.
o.undolevels                 = 10000   -- Set maximum amount of undos.
