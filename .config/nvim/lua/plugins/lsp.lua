return {
	{
		"williamboman/mason.nvim",
		event = { "VeryLazy" },
		dependencies = {
			"mason-org/mason-registry",
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup_handlers({
				function(server)
					local opts = {
						-- -- Function executed when the LSP server startup
						-- on_attach = function(client, bufnr)
						--   local opts = { noremap=true, silent=true }
						--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
						--   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
						-- end,
						-- capabilities = require("cmp_nvim_lsp").default_capabilities(
						-- 	vim.lsp.protocol.make_client_capabilities()
						-- ),
					}
					lspconfig = require("lspconfig")
					lspconfig[server].setup(opts)
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									-- Get the language server to recognize the `vim` global
									globals = { "vim" },
								},
							},
						},
					})
					lspconfig.yamlls.setup({
						settings = {
							yaml = {
								schemaStore = {
									enable = true,
								},
							},
						},
					})
				end,
			})
		end,
	},

	--- lspsaga -> lspsaga.lua

	--- Null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "VeryLazy" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"jay-babu/mason-null-ls.nvim",
				dependencies = { "mason.nvim" },
			},
		},
		config = function()
			-- null ls
			require("null-ls").setup({
				diagnostics_format = "#{m} (#{s}: #{c})",
			})

			require("mason-null-ls").setup({
				handlers = {}, -- `automatic_setup`を正しく動作させるためには、`handlers`が設定されている必要がある。
			})
		end,
	},
}
