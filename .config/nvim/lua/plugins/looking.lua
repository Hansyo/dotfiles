return {
	--- Tree Sitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VeryLazy" },
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		enabled = function()
			return not vim.g.vscode
		end,
		config = function()
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
					enable = true, -- mandatory, false will disable the whole extension
					-- [options]
				},
			})
		end,
	},

	---- Playground
	{
		"nvim-treesitter/playground",
		cmd = {
			"TSPlaygroundToggle",
			"TSNodeUnderCursor",
			"TSHighlightCapturesUnderCursor",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		enabled = function()
			return not vim.g.vscode
		end,
	},

	{
		"folke/twilight.nvim",
		cmd = { "Twilight" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<Plug>(ToggleHotkey)T", "<Plug>(TwilightToggle)", mode = { "n", "i", "v" } },
			{ "<Plug>(TwilightToggle)", "<cmd>Twilight<CR>", mode = { "n", "i", "v" } },
		},
		enabled = function()
			return not vim.g.vscode
		end,
		opts = {
			expand = {
				"function_definition",
				"method",
				"table",
				-- "if_statement",
			},
			context = 999,
		},
	},

	-- Toggle numbers
	{
		"myusuf3/numbers.vim",
		event = { "InsertEnter", "VeryLazy" },
		enabled = function()
			return not vim.g.vscode
		end,
	},

	--- Lualine -> lualine.lua

	--- Notify
	{
		"rcarriga/nvim-notify",
		event = { "VeryLazy" },
		cmd = { "Notifications" },
		keys = {
			{ "<Leader>qn", "<Cmd>lua require('notify').dismiss()<CR>" },
		},
		dependencies = { "nvim-telescope/telescope.nvim" },
		enabled = function()
			return not vim.g.vscode
		end,
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				render = "compact",
			})
			require("telescope").load_extension("notify")
		end,
	},

	--- Noice -> noice.lua

	--- more good neovim ui
	{
		"stevearc/dressing.nvim",
		event = { "VeryLazy" },
		enabled = function()
			return not vim.g.vscode
		end,
	},

	--- Git -> gitsigns.lua
}
