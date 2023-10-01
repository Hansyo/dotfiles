return {
	{
		"unblevable/quick-scope",
		event = { "VeryLazy" },
		init = function()
			vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
		end,
		keys = {
			{ "<Plug>(ToggleHotkey)q", "<plug>(QuickScopeToggle)" },
		},
	},

	--- nvim-bqf
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		enabled = function()
			return not vim.g.vscode
		end,
	},
}
