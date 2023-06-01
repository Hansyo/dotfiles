return function ()
	-- disable default match plugin
	-- vim.g.loaded_matchparen = 1
	-- vim.g.loaded_matchit = 1

	-- vim-matchup settings
	vim.g.matchup_matchparen_offscreen = { method = "popup" }
	vim.g.matchup_surround_enabled = 1
end
