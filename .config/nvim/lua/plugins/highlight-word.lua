return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			delay = 100,
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		})

		local hl = vim.api.nvim_set_hl

		-- Highlight word instead of just underlining it
		hl(0, "IlluminatedWordText" , { link = "Visual" })
		hl(0, "IlluminatedWordRead" , { link = "Visual" })
		hl(0, "IlluminatedWordWrite", { link = "Visual" })

		--- Auto update the highlight style on colorscheme change
		vim.api.nvim_create_autocmd({ "ColorScheme" }, {
			pattern = { "*" },
			callback = function(ev)
				vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
				vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
				vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
			end
		})

		local function map(key, dir, buffer)
			vim.keymap.set(
				"n",
				key,
				function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end,
				{
					desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference",
					buffer = buffer
				}
			)
		end

		map("]]", "next")
		map("[[", "prev")

		-- Also set it after loading ftplugins, since a lot overwrite [[ and ]]
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()

				map("]]", "next", buffer)
				map("[[", "prev", buffer)
			end,
		})
	end,
}
