
local function random_emoji()
	local emojis = {
		"😀","😃","😄","😁","😆","😅","🤣","😂","🙂","🙃","😉","😊","😇","🥰",
		"😍","🤩","😘","😗","😚","😙","🥲","😋","😛","😜","🤪","😝","🤑","🤗",
		"🤭","🤫","🤔","🤐","🤨","😐","😑","😶","😶","🌫️","😏","😒","🙄","😬",
		"😮","💨","🤥","😌","😔","😪","🤤","😴","😷","🤒","🤕","🤢","🤮","🤧",
		"🥵","🥶","🥴","😵","💫","🤯","🤠","🥳","🥸","😎","🤓","🧐","😕","😟",
		"🙁","☹","😮","😯","😲","😳","🥺","😦","😧","😨","😰","😥","😢","😭",
		"😱","😖","😣","😞","😓","😩","😫","🥱","😤","😡","😠","🤬","😈","👿",
		"💀","☠","💩","🤡","👹","👺","👻","😺","😸","😹","😻","😼","😽","🙀",
		"😿","😾","🙈","🙉","🙊"
	}

	math.randomseed(os.time())
	return emojis[math.random(#emojis)]
end

--------------------------------------------------------------------------------

local settings                        = {}
local emoji                           = random_emoji()

settings.extensions                   = {}
settings.inactive_sections            = {}
settings.inactive_winbar              = {}
settings.options                      = {}
settings.sections                     = {}
settings.tabline                      = {}
settings.winbar                       = {}

local options                         = settings.options
local sections                        = settings.sections
local inactive_sections               = settings.inactive_sections

options.always_divide_middle          = true
options.component_separators          = { left = "", right = "" }
options.disabled_filetypes            = {}
options.globalstatus                  = false
options.icons_enabled                 = true
options.ignore_focus                  = {}
options.refresh                       = {}
options.section_separators            = { left = "", right = "" }
options.theme                         = "auto"

options.disabled_filetypes.statusline = {}
options.disabled_filetypes.winbar     = {}

options.refresh.statusline            = 1000
options.refresh.tabline               = 1000
options.refresh.winbar                = 1000

sections.lualine_a                    = { function() return emoji end, "mode"  }
sections.lualine_b                    = { "branch", "diff", "diagnostics"      }
sections.lualine_c                    = { "filename"                           }
sections.lualine_x                    = { "encoding", "fileformat", "filetype" }
sections.lualine_y                    = { "progress"                           }
sections.lualine_z                    = { "location"                           }

inactive_sections.lualine_a           = {}
inactive_sections.lualine_b           = {}
inactive_sections.lualine_c           = { "filename" }
inactive_sections.lualine_x           = {}
inactive_sections.lualine_y           = {}
inactive_sections.lualine_z           = { "location" }

--------------------------------------------------------------------------------

local M        = { "nvim-lualine/lualine.nvim" }

M.dependencies = { "nvim-tree/nvim-web-devicons" }

M.config       = function()

	require("lualine").setup(settings)

end

--------------------------------------------------------------------------------

return M
