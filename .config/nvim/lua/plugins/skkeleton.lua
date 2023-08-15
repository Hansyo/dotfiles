return {
	{
		"vim-skk/skkeleton",
		event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
		dependencies = {
			"vim-denops/denops.vim",
		},
		keys = {
			{ "<C-j>", "<Plug>(skkeleton-enable)", mode = { "c", "i" } },
			{ "<C-k>", "<Plug>(skkeleton-disable)", mode = { "c", "i" } },
			{ "<C-f>", "<Plug>(skkeleton-toggle)", mode = { "c", "i" } },
		},

		config = function()
			vim.fn["skkeleton#config"]({
			globalJisyo = "~/.skk/SKK-JISYO.L",
				userJisyo = "~/.skk/USER-JISYO",
				eggLikeNewline = true, -- 変換モードで改行したときに、確定だけ行う(改行しない)
			})
		end,
	},
	--- Indicator
	{

		"delphinus/skkeleton_indicator.nvim",
		dependencies = { "vim-skk/skkeleton" },
		opts = { fadeOutMs = 0 },
	},
}
