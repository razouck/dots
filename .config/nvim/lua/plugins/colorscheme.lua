return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "zenwritten",
		},
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
	},
	{ "rktjmp/lush.nvim" },
	{
		"rpbritton/zenbones.nvim",
		name = "zenbones",
		priority = 1000,
	},
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			contrast = "soft",
	-- 		})
	-- 		require("gruvbox").load()
	-- 	end,
	-- },
}
