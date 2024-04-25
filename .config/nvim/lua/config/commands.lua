
local api       = vim.api
local augroup   = api.nvim_create_augroup
local autocmd   = api.nvim_create_autocmd
local fn        = vim.fn
local highlight = vim.highlight

-- Remove trailing spaces
autocmd('BufWritePre', { pattern = '*', command = ":%s/\\s\\+$//e" })

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
	group = 'YankHighlight',
	callback = function()
		highlight.on_yank({

			higroup = (
				fn['hlexists']('HighlightedyankRegion') > 0 and
				'HighlightedyankRegion' or
				'IncSearch'
			),
			timeout = '100'
		})
	end
})
