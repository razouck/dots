

local keys = {
	{ "]]", desc = "Next reference"     },
	{ "[[", desc = "Previous reference" },
}

--------------------------------------------------------------------------------

local settings                          = {}

settings.delay                          = 100
settings.large_file_cutoff              = 2000
settings.large_file_overrides           = {}
settings.providers                      = { "lsp", "treesitter" }

settings.large_file_overrides.providers = { "lsp" }

--------------------------------------------------------------------------------

local M  = { "RRethy/vim-illuminate" }

M.event  = { "BufReadPost", "BufNewFile", "BufWritePre" }
M.keys   = keys
M.config = function()

	local api            = vim.api
	local create_autocmd = api.nvim_create_autocmd
	local illuminate     = require("illuminate")
	local set_hl         = api.nvim_set_hl

	local function map(key, direction, description, buffer)
		local args = {
			buffer = buffer,
			desc   = description
		}

		local function command()
			illuminate["goto_" .. direction .. "_reference"](true)
		end

		vim.keymap.set("n", key, command, args)
	end

	illuminate.configure(settings)

	-- Highlight word instead of just underlining it
	set_hl(0, "IlluminatedWordText" , { link = "Visual" })
	set_hl(0, "IlluminatedWordRead" , { link = "Visual" })
	set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

	--- Auto update the highlight style on colorscheme change
	create_autocmd({ "ColorScheme" }, {
		pattern  = { "*" },
		callback = function(ev)

			set_hl(0, "IlluminatedWordText", { link = "Visual" })
			set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end
	})

	map(keys[2][1], "prev", keys[2]["desc"])
	map(keys[1][1], "next", keys[1]["desc"])

	-- Also set it after loading ftplugins, since a lot overwrite [[ and ]]
	create_autocmd("FileType", {
		callback = function()

			local buffer = api.nvim_get_current_buf()

			map(keys[1][1], "next", keys[1]["desc"], buffer)
			map(keys[2][1], "prev", keys[2]["desc"], buffer)
		end,
	})
end

--------------------------------------------------------------------------------

return M
