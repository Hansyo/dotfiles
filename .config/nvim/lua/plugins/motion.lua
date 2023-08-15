return {
	--- More Better f/t jump
	{
		"hrsh7th/vim-eft",
		keys = {
			{ ";", "<Plug>(eft-repeat)", mode = { "n", "x", "o" } },
			{ "f", "<Plug>(eft-f)", mode = { "n", "x", "o" } },
			{ "F", "<Plug>(eft-F)", mode = { "n", "x", "o" } },
			{ "t", "<Plug>(eft-t)", mode = { "n", "x", "o" } },
			{ "T", "<Plug>(eft-T)", mode = { "n", "x", "o" } },
		},
	},
	{
		"skanehira/jumpcursor.vim",
		keys = {
			{ "<Leader>t", "<Plug>(jumpcursor-jump)", mode = { "n", "v" } },
		},
	},
	--- alt-matchup -- Don't do lazy load
	{
		"andymass/vim-matchup",
		init = function()
			-- disable default match plugin
			vim.g.loaded_matchparen = 1
			vim.g.loaded_matchit = 1

			-- vim-matchup settings
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
			vim.g.matchup_surround_enabled = 1
		end,
	},
}
