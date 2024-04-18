local plugin = {}

--------------------------------------------------------------------------------

local keys = {
	{ "gc"  , desc = "Comment"      },
	{ "gcc" , desc = "Comment line" },
}

--------------------------------------------------------------------------------

local comment = { "echasnovski/mini.comment" }

plugin[1] = comment

comment.event = "VeryLazy"
comment.keys  = keys
comment.opts  = {}

comment.opts.mappings = {}
comment.opts.options  = {}

comment.opts.mappings.comment        = keys[1][1]
comment.opts.mappings.comment_line   = keys[2][1]
comment.opts.mappings.comment_visual = keys[1][1]
comment.opts.mappings.text_object    = keys[1][1]

comment.opts.options.custom_commentstring = function ()
	local internal  = require("ts_context_commentstring.internal")
	local calculate = internal.calculate_commentstring

	return calculate() or vim.bo.commentstring
end

--------------------------------------------------------------------------------

local ts_comment = { "JoosepAlviste/nvim-ts-context-commentstring" }

plugin[2] = ts_comment

ts_comment.lazy = true
ts_comment.opts = {}

ts_comment.opts.enable_autocmd = false

--------------------------------------------------------------------------------

return plugin
