local keys = {
	{ "<leader>u", desc = "Toggle Undo Tree" }
}

local function config()
	local keymap = keys[1][1]
	local buffer = { desc = keys[1]["desc"] }

	vim.keymap.set("n", keymap, vim.cmd.UndotreeToggle, buffer)
end

return {
	'mbbill/undotree',
	keys = keys,
	config = config,
}
