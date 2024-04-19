
local keys = {
	{ "gc"  , desc = "Comment"      },
	{ "gcc" , desc = "Comment line" },
}

--------------------------------------------------------------------------------

local M = {}

--------------------------------------------------------------------------------

local comment                     = { "echasnovski/mini.comment" }

comment.event                     = "VeryLazy"
comment.keys                      = keys
comment.opts                      = {}

local opts                        = comment.opts

opts.mappings                     = {}
opts.options                      = {}

opts.mappings.comment             = keys[1][1]
opts.mappings.comment_line        = keys[2][1]
opts.mappings.comment_visual      = keys[1][1]
opts.mappings.text_object         = keys[1][1]

opts.options.custom_commentstring = function ()

	local internal  = require("ts_context_commentstring.internal")
	local calculate = internal.calculate_commentstring

	return calculate() or vim.bo.commentstring
end

table.insert(M, comment)

--------------------------------------------------------------------------------

local ts               = { "JoosepAlviste/nvim-ts-context-commentstring" }

ts.lazy                = true
ts.opts                = {}

ts.opts.enable_autocmd = false

table.insert(M, ts)

--------------------------------------------------------------------------------

return M
