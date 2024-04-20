
local settings                             = {}

settings.ensure_installed                  = "all"
settings.ignore_install                    = { "julia", "php" }
settings.highlight                         = {}
settings.additional_vim_regex_highlighting = false
settings.auto_install                      = true
settings.sync_install                      = false

settings.highlight.enable                  = true

--------------------------------------------------------------------------------

local M  = { "nvim-treesitter/nvim-treesitter" }

M.build  = ":TSUpdate"
M.config = function() require("nvim-treesitter.configs").setup(settings) end

--------------------------------------------------------------------------------

return M
