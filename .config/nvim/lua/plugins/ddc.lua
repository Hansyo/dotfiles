function tab_expand(all_ignore, direction)
	if vim.fn["pum#visible"]() then
		vim.fn["pum#map#insert_relative"](direction)
	elseif vim.fn["vsnip#expandable"]() then
		if vim.fn["vsnip#jumpable"](direction) then
			if direction > 0 then
				return "<Plug>(vsnip-jump-next)"
			else
				return "<Plug>(vsnip-jump-prev)"
			end
		end
		return all_ignore
	else
		local _col = vim.fn.col(".") - 1
		if _col <= 0 then
			return all_ignore
		end
		local from_idx, to_idx = vim.regex([[\s]]):match_str(vim.fn.getline("."):sub(_col, _col+1))
		if from_idx ~= nil and to_idx ~= nil then
			return all_ignore
		end
		vim.fn["ddc#map#manual_complete"]()
	end
end

return {
	{
		"Shougo/ddc.vim",
		event = { "VeryLazy", "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"vim-denops/denops.vim", -- requirement
			"Shougo/pum.vim", -- popup menu
			-- ui
			"Shougo/ddc-ui-pum", -- pum ui
			"Shougo/ddc-ui-native", -- native ui
			-- sources
			"Shougo/ddc-source-around",
			"matsui54/ddc-buffer",
			"Shougo/ddc-nvim-lsp",
			"Shougo/ddc-source-cmdline",
			"Shougo/ddc-source-cmdline-history",
			"Shougo/ddc-source-copilot",
			"github/copilot.vim",
			"LumaKernel/ddc-source-file",
			"delphinus/ddc-treesitter",
			"uga-rosa/ddc-source-vsnip",
			-- filters
			"Shougo/ddc-matcher_head",
			"Shougo/ddc-sorter_rank",
			"Shougo/ddc-converter_remove_overlap",
			"tani/ddc-fuzzy",
		},
		config = function()
			vim.fn["ddc#custom#patch_global"]({
				ui = "pum",
				sources = {
					"around",
					"buffer",
					"vsnip",
					"nvim-lsp",
					"cmdline",
					"cmdline-history",
					"file",
					"treesitter",
					"copilot",
				},
				sourceOptions = {
					_ = {
						matchers = { "matcher_fuzzy", "matcher_head" },
						sorters = { "sorter_fuzzy", "sorter_rank" },
						converters = { "converter_fuzzy", "converter_remove_overlap" },
					},
					around = { mark = "󰈙" }, -- icon from nerdfont
					buffer = { mark = "" }, -- icon from nerdfont
					vsnip = { mark = "snip" },
					["nvim-lsp"] = {
						mark = "lsp",
						forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
					},
					cmdline = { mark = " " }, -- icon from nerdfont
					["cmdline-history"] = { mark = "hist" },
					file = {
						mark = " ", -- icon from nerdfont nf-oct-rel_file_path
						isVolatile = true,
						forceCompletionPattern = [[\S/\S*]],
					},
					treesitter = { mark = "TS" },
					copilot = {
						mark = "󰊤",
						matchers = {},
						minAutoCompleteLength = 0,
					},
				},
				sourceParams = {
					around = { maxSize = 500 },
					buffer = {
						requireSameFIletype = true,
						limitBytes = 5000000,
						fromAltBuf = true,
						forceCollect = true,
					},
				},
				filterParams = {
					convertr_fuzzy = {
						hlGroup = "SpellBad",
					},
				},
			})

			-- skkeleton 特有の設定
			local function skkeleton_enable_pre()
				vim.g["prev_buffer_config"] = vim.fn["ddc#custom#get_buffer"]()
				vim.fn["ddc#custom#patch_buffer"]({
					sources = { "skkeleton" },
					sourceOptions = {
						skkeleton = {
							mark = "skk",
							matchers = { "skkeleton" },
							sorters = {},
							minAutoCompleteLength = 2,
						},
					},
				})
			end

			local function skkeleton_disable_pre()
				vim.fn["ddc#custom#set_buffer"](vim.g["prev_buffer_config"])
			end

			local autocmd = vim.api.nvim_create_autocmd
			local skkeleton_callbacks = vim.api.nvim_create_augroup("skkeleton_callbacks", { clear = true })
			autocmd("User", {
				pattern = "skkeleton-enable-pre",
				group = skkeleton_callbacks,
				callback = skkeleton_enable_pre,
			})
			autocmd("User", {
				pattern = "skkeleton-disable-pre",
				group = skkeleton_callbacks,
				callback = skkeleton_disable_pre,
			})

			vim.fn["ddc#enable"]() -- Enable this plugin
		end,
	},
	---- pum.vim
	{
		"Shougo/pum.vim", -- popup menu
		event = { "VeryLazy" },
		keys = {
			{
				"<CR>",
				function()
					if vim.fn["pum#visible"]() then
						vim.fn["pum#map#confirm"]()
					else
						return "<CR>"
					end
				end,
				mode = { "i" },
				expr = true,
			},
			{
				"<Tab>",
				function()
					return tab_expand("<Tab>", 1)
				end,
				mode = { "i", "s" },
				-- expr = true,
			},
			{
				"<S-Tab>",
				function()
					return tab_expand("<S-Tab>", -1)
				end,
				mode = { "i", "s" },
			},
			{
				"<C-n>",
				function()
					vim.fn["pum#map#select_relative"](1)
				end,
				mode = { "i" },
			},
			{
				"<C-p>",
				function()
					vim.fn["pum#map#select_relative"](-1)
				end,
				mode = { "i" },
			},
			{
				"<C-y>",
				function()
					vim.fn["pum#map#confirm"]()
				end,
				mode = { "i" },
			},
			{
				"<C-e>",
				function()
					vim.fn["pum#map#cancel"]()
				end,
				mode = { "i" },
			},
		},
	},
}
