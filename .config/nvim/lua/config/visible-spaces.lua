local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local hl = vim.api.nvim_set_hl
local opt = vim.opt
local space = "·"

opt.list = true
opt.listchars:append{
	lead       = space,
	multispace = space,
	nbsp       = space,
	tab        = "→" .. " ",
	trail      = space,
}

cmd([[match TrailingWhiteSpace /\s\+$/]])
hl(0, "TrailingWhiteSpace", { link = "Error" })

autocmd("InsertEnter", {
	callback = function()
		opt.listchars.trail = nil
		hl(0, "TrailingWhiteSpace", { link = "Whitespace" })
	end
})

autocmd("InsertLeave", {
	callback = function()
		opt.listchars.trail = space
		hl(0, "TrailingWhiteSpace", { link = "Error" })
	end
})
