return function()
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		sync_install = true,
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
		},
		matchup = {
			enable = true,           -- mandatory, false will disable the whole extension
			-- [options]
		},
	})
end
