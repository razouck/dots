
local M = {}

--------------------------------------------------------------------------------

local lsp_zero        = {}
local lspconfig       = {}
local mason           = {}
local mason_lspconfig = {}

--------------------------------------------------------------------------------

return {
	-- Mason
	{
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup({})
		end,
	},

	-- Mason LSP Config
	{
		'williamboman/mason-lspconfig.nvim',
		config =
				function()
			local lsp_zero = require('lsp-zero')

			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })

				local map = vim.keymap.set
				local opts = { buffer = bufnr, remap = false }

				map(
					"n",
					"gd",
					function()
						vim.lsp.buf.definition()
					end,
					opts
				)
				map(
					"n",
					"K",
					function()
						vim.lsp.buf.hover()
					end,
					opts
				)
				map(
					"n",
					"<leader>vws",
					function()
						vim.lsp.buf.workspace_symbol()
					end,
					opts
				)
				map(
					"n",
					"<leader>vd",
					function()
						vim.diagnostic.buf.open_float()
					end,
					opts
				)
				map(
					"n",
					"[d",
					function()
						vim.diagnostic.goto_next()
					end,
					opts
				)
				map(
					"n",
					"]d",
					function()
						vim.diagnostic.goto_prev()
					end,
					opts
				)
				map(
					"n",
					"<leader>vca",
					function()
						vim.lsp.buf.code_action()
					end,
					opts
				)
				map(
					"n",
					"<leader>vrr",
					function()
						vim.lsp.buf.references()
					end,
					opts
				)
				map(
					"n",
					"<leader>vrn",
					function()
						vim.lsp.buf.rename()
					end,
					opts
				)
				map(
					"i",
					"<C-h>",
					function()
						vim.lsp.signature_help()
					end,
					opts
				)
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end
				},
			})
		end,
	},

	-- LSP Zero
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
	},

	-- LSP Config
	{ 'neovim/nvim-lspconfig' },
}
