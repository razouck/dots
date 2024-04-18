local keys = {
	{ "]]", desc = "Next reference"     },
	{ "[[", desc = "Previous reference" },
}

local function config()
	local api = vim.api
	local create_autocmd = api.nvim_create_autocmd
	local illuminate = require("illuminate")
	local set_hl = api.nvim_set_hl

	illuminate.configure({
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

	-- Highlight word instead of just underlining it
	set_hl(0, "IlluminatedWordText" , { link = "Visual" })
	set_hl(0, "IlluminatedWordRead" , { link = "Visual" })
	set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

	--- Auto update the highlight style on colorscheme change
	create_autocmd({ "ColorScheme" }, {
		pattern = { "*" },
		callback = function(ev)
			set_hl(0, "IlluminatedWordText", { link = "Visual" })
			set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end
	})

	local function map(key, direction, description, buffer)
		local args = {
			desc = description,
			buffer = buffer
		}

		local function command()
			illuminate["goto_" .. direction .. "_reference"](true)
		end

		vim.keymap.set("n", key, command, args)
	end

	-- map("]]", "next", "Next reference")
	-- map("[[", "prev", "Previous reference")

	map(keys[1][1], "next", keys[1]["desc"])
	map(keys[2][1], "prev", keys[2]["desc"])

	-- Also set it after loading ftplugins, since a lot overwrite [[ and ]]
	create_autocmd("FileType", {
		callback = function()
			local buffer = api.nvim_get_current_buf()

			map(keys[1][1], "next", keys[1]["desc"], buffer)
			map(keys[2][1], "prev", keys[2]["desc"], buffer)
		end,
	})
end

return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	keys = keys,
	config = config,
}
