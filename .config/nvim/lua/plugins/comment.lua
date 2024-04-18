local keys = {
	{ "gc"  , desc = "Comment"      },
	{ "gcc" , desc = "Comment line" },
}

return {
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		keys = keys,
		opts = {
			mappings = {
				comment = "gc",
				comment_line = "gcc",
				comment_visual = "gc",
				text_object = "gc",
			},
			options = {
				custom_commentstring = function()
					local c = require("ts_context_commentstring.internal")

					return c.calculate_commentstring() or vim.bo.commentstring
				end,
			},
		},
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
}
