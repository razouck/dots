
local plugin = { "brenoprata10/nvim-highlight-colors" }

plugin.config = function()
	require("nvim-highlight-colors").turnOn()
end

return plugin
