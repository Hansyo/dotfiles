local function merge_table(target, value)
	if target == nil then
		return value
	elseif type(target) == "string" then
		table.insert(value, target)
		return value
	elseif type(target) == "table" then
		local tmp = {}
		for _, v in pairs(target) do
			table.insert(tmp, v)
		end
		for _, v in pairs(value) do
			table.insert(tmp, v)
		end
		return tmp
	else
		error("targetの指定方法が誤っています")
	end
end
local function vl(pkg)
	if type(pkg) == "string" then
		pkg = { pkg }
	end
	pkg.event = merge_table(pkg.event, { "VeryLazy" })
	return pkg
end

return {
	vl("christoomey/vim-tmux-navigator"),
	vl("nvim-lua/plenary.nvim"), -- いろんな奴らの依存プラグイン
	vl("vim-jp/vimdoc-ja"),
	vl("tpope/vim-repeat"), -- Expand dot repeat

	-- LSP
	vl({
		"williamboman/mason.nvim",
		dependencies = {
			"mason-org/mason-registry",
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = require("extensions.config.mason"),
	}),

	vl({
		"glepnir/lspsaga.nvim",
		branch = "main",
		-- event = "LspAttach",
		keys = require("extensions.keys.lspsaga"),
		config = require("extensions.config.lspsaga"),
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	}),

	--- Null-ls
	{
		"jay-babu/mason-null-ls.nvim",
		lazy = true,
		dependencies = { "mason.nvim" },
		-- config -> null-lsに併記
	},
	vl({
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = require("extensions.config.null-ls"),
	}),

	-- Edit関連
	--- 補完
	---- nvim-cmp
	-- vl({
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
	-- }),

	---- ddc.vim
	vl({
		"Shougo/ddc.vim",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"vim-denops/denops.vim", -- requirement
			"Shougo/pum.vim", -- popup menu
			-- ui
			"Shougo/ddc-ui-pum", -- pum ui
			"Shougo/ddc-ui-native", -- native ui
			-- sources
			"Shougo/ddc-source-around",
			"matsui54/ddc-buffer",
			"Shougo/ddc-nvim-lsp",
			"Shougo/ddc-source-cmdline",
			"Shougo/ddc-source-cmdline-history",
			"LumaKernel/ddc-source-file",
			"delphinus/ddc-treesitter",
			"uga-rosa/ddc-source-vsnip",
			-- filters
			"Shougo/ddc-matcher_head",
			"Shougo/ddc-sorter_rank",
			"Shougo/ddc-converter_remove_overlap",
			"tani/ddc-fuzzy",
		},
		config = require("extensions.config.ddc-vim"),
	}),
	---- pum.vim
	vl({
		"Shougo/pum.vim", -- popup menu
		keys = require("extensions.keys.pum-vim"),
	}),

	--- Snippet
	vl({
		"hrsh7th/vim-vsnip",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/vim-vsnip-integ",
			"rafamadriz/friendly-snippets",
		},
		config = require("extensions.config.vim-vsnip"),
	}),
	--- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"rcarriga/nvim-notify",
		},
		keys = require("extensions.keys.telescope"),
		config = require("extensions.config.telescope"),
	},
	--- Parences
	vl({
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = require("extensions.config.nvim-surround"),
	}),
	--- Comments
	vl({
		"terrortylor/nvim-comment",
		config = require("extensions.config.nvim-comment"),
	}),

	-- Motion
	--- More Better f/t jump
	{
		"hrsh7th/vim-eft",
		keys = require("extensions.keys.vim-eft"),
	},
	{
		"skanehira/jumpcursor.vim",
		keys = require("extensions.keys.jumpcursor"),
	},
	--- alt-matchup -- Don't do lazy load
	{
		"andymass/vim-matchup",
		init = require("extensions.setup.vim-matchup"),
	},

	-- Looking
	--- Tree Sitter
	vl({
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = require("extensions.config.nvim-treesitter"),
	}),
	{
		"folke/twilight.nvim",
		cmd = { "Twilight" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		keys = require("extensions.keys.twilight"),
		config = require("extensions.config.twilight"),
	},
	-- Toggle numbers
	vl({
		"myusuf3/numbers.vim",
		event = { "InsertEnter" },
	}),
	--- Alt StatusLine
	vl({
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
		config = require("extensions.config.lualine"),
	}),
	--- Noice!!
	vl({
		"rcarriga/nvim-notify",
		cmd = { "Notifications" },
		keys = require("extensions.keys.nvim-notify"),
		config = require("extensions.config.nvim-notify"),
	}),
	vl({
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = require("extensions.config.noice"),
	}),
	--- more good neovim ui
	vl("stevearc/dressing.nvim"),
	--- Git
	vl({
		"lewis6991/gitsigns.nvim",
		config = require("extensions.config.gitsigns"),
	}),

	-- Highlights
	--- Trailing Whitespace
	vl({
		"bronson/vim-trailing-whitespace",
		config = require("extensions.config.vim-trailing-whitespace"),
	}),
	--- Colorscheme
	vl({
		"bluz71/vim-nightfly-colors",
		lazy = false,
	}),
	--- Todo Comments
	vl({
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		keys = require("extensions.keys.todo-comments"),
		config = require("extensions.config.todo-comments"),
	}),
	--- Indent Line
	vl({
		"lukas-reineke/indent-blankline.nvim",
		config = require("extensions.config.indent-blankline"),
	}),
	--- Colorcode
	{
		"norcalli/nvim-colorizer.lua",
		cmd = {
			"ColorizerToggle",
			"ColorizerAttachToBuffer",
			"ColorizerDetachFromBuffer",
			"ColorizerReloadAllBuffers",
		},
	},

	-- QuickFIX
	--- quick-scope
	vl({
		"unblevable/quick-scope",
		init = require("extensions.setup.quick-scope"),
		keys = require("extensions.keys.quick-scope"),
	}),

	--- nvim-bqf
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Languages
	--- Markdown
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- skkeleton
	vl({
		"vim-skk/skkeleton",
		event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
		dependencies = {
			"vim-denops/denops.vim",
		},
		keys = require("extensions.keys.skkeleton"),
		config = require("extensions.config.skkeleton"),
	}),
	--- Indicator
	vl({
		"delphinus/skkeleton_indicator.nvim",
		dependencies = { "vim-skk/skkeleton" },
		opts = { fadeOutMs = 0 },
	}),

	-- Calc startup time
	{
		"dstein64/vim-startuptime",
		cmd = { "StartupTime" },
	},
}
