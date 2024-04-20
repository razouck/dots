
local keys   = {
	{ "<leader>u", desc = "Toggle Undo Tree" }
}

--------------------------------------------------------------------------------

local M = { "mbbill/undotree" }

M.keys   = keys
M.config = function()

	local keymap = keys[1][1]
	local buffer = { desc = keys[1]["desc"] }

	vim.keymap.set("n", keymap, vim.cmd.UndotreeToggle, buffer)
end

--------------------------------------------------------------------------------

return M
