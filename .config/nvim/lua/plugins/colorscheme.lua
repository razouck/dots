
local cmd = vim.cmd
local M   = {}

--------------------------------------------------------------------------------

local zenbones        = { "rpbritton/zenbones.nvim" }

zenbones.name         = "zenbones"
zenbones.dependencies = { "rktjmp/lush.nvim" }
zenbones.lazy         = false
zenbones.priority     = 1000
zenbones.config       = function() cmd("colorscheme zenwritten") end

table.insert(M, zenbones)

--------------------------------------------------------------------------------

return M
