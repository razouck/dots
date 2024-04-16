return {
	"ThePrimeagen/harpoon",
	config = function ()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local map = vim.keymap.set

		map("n", "<leader>a", mark.add_file)
		map("n", "<C-e>", ui.toggle_quick_menu)
		map("n", "<C-h>", function () ui.nav_file(1) end)
		map("n", "<C-t>", function () ui.nav_file(2) end)
		map("n", "<C-n>", function () ui.nav_file(3) end)
		map("n", "<C-s>", function () ui.nav_file(4) end)

		require("harpoon").setup()
	end
}
