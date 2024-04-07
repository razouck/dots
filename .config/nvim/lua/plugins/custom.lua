return {
	-- This shit didn't even work, for real.
	-- My python code is still getting formatted to hell.
	{
		"stevearc/conform.nvim",
		opts = function()
			---@class ConformOpts
			local opts = {
				format = {
					timeout_ms = 3000,
					async = false, -- not recommended to change
					quiet = false, -- not recommended to change
					lsp_fallback = true, -- not recommended to change
				},

				---@type table<string, conform.FormatterUnit[]>
				formatters_by_ft = {
					lua = { "stylua" },
					fish = { "fish_indent" },
				},

				---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
				formatters = {
					injected = { options = { ignore_errors = true } },
				},
			}
			return opts
		end,
	},

	-- Add a colorizer
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").turnOn()
		end,
	},

	-- add pyright to lspconfig
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				pyright = {},
				bashls = {},
			},
		},
	},

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"css",
				"haskell",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"rasi",
				"regex",
				"typescript",
			},
		},
	},

	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	-- then: setup supertab in cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api
							.nvim_buf_get_lines(0, line - 1, line, true)[1]
							:sub(col, col)
							:match("%s")
						== nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						-- this way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})
		end,
	},

	{
		"wakatime/vim-wakatime",
		lazy = false,
	},
}
