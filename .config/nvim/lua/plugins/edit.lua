return {

	--- 補完
	---- nvim-cmp
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-vsnip",
	-- 		"hrsh7th/vim-vsnip",
	-- 		"onsails/lspkind.nvim",
	-- 		"hrsh7th/cmp-nvim-lsp-signature-help",
	-- 		{ "hrsh7th/cmp-cmdline", event = { "CmdlineEnter" } },
	-- 		{ "rinx/cmp-skkeleton", dependencies = { "vim-skk/skkeleton" } },
	-- 	},
	-- 	config = require("extensions.config.nvim-cmp"),
	-- },

	---- ddc.vim -> ddc.lua

	--- Snippet
	{
		"hrsh7th/vim-vsnip",
		event = { "InsertEnter", "VeryLazy" },
		dependencies = {
			"hrsh7th/vim-vsnip-integ",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local autocmd = vim.api.nvim_create_autocmd
			local vim_vsnip_user = vim.api.nvim_create_augroup("VimVsnipUser", { clear = true })
			autocmd("User", {
				pattern = "PumCompleteDone",
				group = vim_vsnip_user,
				command = "call vsnip_integ#on_complete_done(g:pum#completed_item)",
			})
		end,
	},

	--- Telescope -> telescope.lua

	--- Parences
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = { "VeryLazy" },
		opts = {},
	},
	--- Comments
	{
		"terrortylor/nvim-comment",
		event = { "VeryLazy" },
		config = function()
			require("nvim_comment").setup({})
		end,
	},

	--- Copilot
	{
		"github/copilot.vim",
		event = { "VeryLazy" },
		config = function()
			vim.g.copilot_filetypes = {
				yaml = true,
				toml = true,
				md = true,
			}
		end,
	},
}
