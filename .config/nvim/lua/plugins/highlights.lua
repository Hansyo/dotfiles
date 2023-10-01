return {
	-- Trailing whitespace
	{
		"bronson/vim-trailing-whitespace",
		event = { "VeryLazy" },
		config = function()
			vim.g.extra_whitespace_ignored_filetypes = { "markdown", "md" }
		end,
	},

	-- nightfly
	{
		"bluz71/vim-nightfly-colors",
		lazy = false,
		enabled = function()
			return not vim.g.vscode
		end,
	},

	-- todo-comments
	{
		"folke/todo-comments.nvim",
		event = { "VeryLazy" },
		dependencies = "nvim-lua/plenary.nvim",
		keys = {
			{ "]t", "<Cmd>lua require('todo-comments').jump_next()<CR>", mode = { "n" }, desc = "Next todo comment" },
			{
				"[t",
				"<Cmd>lua require('todo-comments').jump_prev()<CR>",
				mode = { "n" },
				desc = "Previous todo comment",
			},
		},
		opts = {},
	},

	-- indent
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "VeryLazy" },
		opts = {
			show_current_context = true,
			show_current_context_start = true,
		},
	},

	--- Colorcode
	{
		"norcalli/nvim-colorizer.lua",
		event = { "VeryLazy" },
		cmd = {
			"ColorizerToggle",
			"ColorizerAttachToBuffer",
			"ColorizerDetachFromBuffer",
			"ColorizerReloadAllBuffers",
		},
	},
}
