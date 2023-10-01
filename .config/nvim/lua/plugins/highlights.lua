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
		main = "ibl",
		opts = {
			indent = {
				char = "┋",
				whitespace = { highlight = { "Whitespace", "NonText" } },
			},
			scope = {
				show_start = false,
				show_end = false,
				include = {
					node_type = {
						python = {
							"import_from_statement",
							"if_statement",
							"for_statement",
							"while_statement",
							"try_statement",
							"with_statement",
							"match_statement",
							"case_clause",
							"expression_statement",
						},
						lua = {
							"table_constructor",
						},
					},
				},
			},
		},
	},

	-- Winsep
	{
		"nvim-zh/colorful-winsep.nvim",
		-- config = true,
		event = { "WinNew" },
		opts = {
			highlight = { fg = "#7b9e47" },
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
