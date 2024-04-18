
local settings             = {}

settings.indent            = {}
settings.scope             = {}
settings.exclude           = {}

settings.indent.char       = "│"
settings.indent.tab_char   = "│"

settings.scope.enabled     = false

settings.exclude.filetypes = {
	"alpha",
	"dashboard",
	"help",
	"lazy",
	"lazyterm",
	"mason",
	"neo-tree",
	"notify",
	"toggleterm",
	"trouble",
	"Trouble",
}

--------------------------------------------------------------------------------

local M  = { "lukas-reineke/indent-blankline.nvim" }

M.main   = "ibl"
M.config = function() require("ibl").setup(settings) end

--------------------------------------------------------------------------------

return M
