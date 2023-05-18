return function()
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "vsnip" },
			{ name = "nvim_lsp_signature_help" },
		},
		formatting = {
			format = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
				ellopsis_char = "...",
			}),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<TAB>"] = cmp.mapping.select_next_item(),
			["<S-TAB>"] = cmp.mapping.select_prev_item(),
			["<C-l>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		experimental = {
			ghost_text = true,
		},
	})
	-- `/` cmdline setup.
	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})
	-- `:` cmdline setup.
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{
				name = 'cmdline',
				option = {
					ignore_cmds = { 'Man', '!' }
				}
			}
		})
	})
end
