return function()
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
end
