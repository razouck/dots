return {
	{ "rktjmp/lush.nvim" },
	{
		"rpbritton/zenbones.nvim",
		name = "zenbones",
		lazy = false,
		priority = 1000,
		config = function ()
			vim.cmd("colorscheme zenwritten")
		end,
	},
}
