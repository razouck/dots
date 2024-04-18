local function config()
	require("ibl").setup({
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false, },
		exclude = {
			filetypes = {
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
			},
		},
	})
end

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = config,
	}
}
