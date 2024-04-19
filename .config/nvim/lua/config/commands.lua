
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd     = vim.cmd

cmd([[autocmd BufWritePre * %s/\s\+$//e]]) -- Remove trailing white spaces
