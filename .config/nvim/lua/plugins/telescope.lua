local keys = {
	{ "<leader>fg", desc = "Find files by content" },
	{ "<leader>ff", desc = "Find files by name"    },
	{ "<leader>fb", desc = "Show buffers"          },
	{ "<leader>g" , desc = "Show git files"        },
	{ "<leader>fh", desc = "Show help tags"        },
}

local plugin = { "nvim-telescope/telescope.nvim" }

plugin.dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope-fzf-native.nvim",
}

plugin.keys   = keys
plugin.config = function()

	local builtin = require("telescope.builtin")
	require('telescope').setup()

	local commands = {
		builtin.live_grep,
		builtin.find_files,
		builtin.buffers,
		builtin.help_tags,
		builtin.git_files,
	}

	for i = 1, #commands do
		local key          = keys[i]
		local command      = commands[i]
		local description  = { desc = key["desc"] }
		local keymap       = key[1]

		vim.keymap.set("n", keymap, command, { desc = description })
	end
end

return plugin
