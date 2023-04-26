require('nvim-treesitter.configs').setup({
	ensure_inabled = 'all',
	auto_install = true,
	sync_install = true,
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	}
})
