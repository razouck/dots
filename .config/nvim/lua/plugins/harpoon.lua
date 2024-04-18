local keys = {
	{ "<leader>a", desc = "Add file to harpoon"             },
	{ "<C-e>"    , desc = "Open harpoon window"             },
	{ "<C-1>"    , desc = "Select first file in harpoon"    },
	{ "<C-2>"    , desc = "Select second file in harpoon"   },
	{ "<C-3>"    , desc = "Select third file in harpoon"    },
	{ "<C-4>"    , desc = "Select fourth file in harpoon"   },
	{ "<C-p>"    , desc = "Select previous file in harpoon" },
	{ "<C-n>"    , desc = "Select next file in harpoon"     }
}

local function config()
	local harpoon = require("harpoon")
	local list = harpoon:list()
	local ui = harpoon.ui

	harpoon:setup()

	local commands = {
		function() list:add()                           end,
		function() ui:toggle_quick_menu(harpoon:list()) end,
		function() list:select(1)                       end,
		function() list:select(2)                       end,
		function() list:select(3)                       end,
		function() list:select(4)                       end,
		function() list:prev()                          end,
		function() list:next()                          end
	}

	for i = 1, #commands do
		local key = keys[i]
		local command = commands[i]
		local description = key["desc"]
		local keymap = key[1]

		vim.keymap.set("n", keymap, command, { desc = description  })
	end
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	keys = keys,
	config = config
}
