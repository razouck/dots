return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function ()
			local builtin = require("telescope.builtin")
			local map = vim.keymap.set

			map("n", "<leader>ff", builtin.find_files, {})
			map("n", "<leader>fg", builtin.live_grep, {})
			map("n", "<leader>fb", builtin.buffers, {})
			map("n", "<leader>fh", builtin.help_tags, {})
			map("n", "<C-p>", builtin.git_files, {})

			require('telescope').setup()
		end,
	},
}