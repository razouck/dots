local function m(mode, remap, action, description)
	local set = vim.keymap.set

	if description == nil then
		set(mode, remap, action)
	else
		set(mode, remap, action, { desc = description })
	end
end

---------------------------------------------------------------------------------

-- Clear search with <esc>
m({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Escape and Clear hlsearch")

-- Clipboard
m({ "n", "v" }, "<leader>y", '"+y', "Copy to clipboard")
m("n", "<leader>Y", '"+yg_', "Copy content after the cursor to clipboard")
m("n", "<leader>yy", '"+yy', "Copy line to clipboard")
m("n", "<leader>p", '"+p', "Paste from clipboard")
m("n", "<leader>P", '"+P', "Paste from clipboard (before cursor)")

-- File Navigation
m("n", "<leader>fx", vim.cmd.Ex, "Open file manager")

-- Highlights under remaprsor
m("n", "<leader>ui", vim.show_pos, "Inspect Pos")

-- Indenting
m("v", "<", "<gv", "Indent selection")
m("v", ">", ">gv", "Unindent selection")

-- Lazy
m("n", "<leader>l", "<cmd>Lazy<cr>", "Lazy")

-- Mason
m("n", "<leader>m", "<cmd>Mason<cr>", "Mason")

-- Move lines
m("v", "J", ":m '>+1<cr>gv=gv", "Move selection up")
m("v", "K", ":m '<-2<cr>gv=gv", "Move selection down")

-- New File
m("n", "<leader>fn", "<cmd>enew<cr>", "New File")

-- Search
m("n", "n", "nzzzv")
m("n", "N", "Nzzzv")

-- Substitution
m("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Unmap
m("n", "Q", "<nop>")
