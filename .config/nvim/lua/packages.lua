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
	pkg.event = merge_table(pkg.event, { "VeryLazy" })
	return pkg
end

local ev_BufLazy = { "BufRead", "BufNewFile", "VimEnter" }
local ev_noice = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" }


return {
	vl({ "christoomey/vim-tmux-navigator" }),
	vl({ "nvim-lua/plenary.nvim" }), -- いろんな奴らの依存プラグイン
	vl({ "Yggdroot/indentLine" }),
	vl({ "vim-jp/vimdoc-ja" }),
	vl({ "tpope/vim-repeat" }), -- Expand dot repeat

	-- LSP
	vl({
		"williamboman/mason.nvim",
		event = ev_BufLazy,
		dependencies = {
			"mason-org/mason-registry",
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = require("extensions.config.mason"),
	}),

	--- LSPの状態を表示するやつ。軽いので、lazy load は不要。
	vl({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
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

	-- -- Null-ls
	{
		"jay-babu/mason-null-ls.nvim",
		lazy = true,
		dependencies = { "mason.nvim" },
		-- config -> null-lsに併記
	},
	vl({
		"jose-elias-alvarez/null-ls.nvim",
		event = ev_BufLazy,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = require("extensions.config.null-ls"),
	}),

	-- Snippet
	vl({
		"hrsh7th/vim-vsnip",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/vim-vsnip-integ",
			"rafamadriz/friendly-snippets",
		},
		config = require("extensions.config.vim-vsnip"),
	}),

	-- Tree Sitter
	vl({
		"nvim-treesitter/nvim-treesitter",
		run = function()
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

	-- Easy Search
	{
		"hrsh7th/vim-searchx",
		fn = "searchx#*",
		keys = require("extensions.keys.vim-searchx"),
		config = require("extensions.config.vim-searchx"),
	},

	{
		"skanehira/jumpcursor.vim",
		keys = require("extensions.keys.jumpcursor"),
	},

	-- Telescope
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

	-- 補完
	vl({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			{ "hrsh7th/cmp-cmdline", event = { "CmdlineEnter" } },
		},
		config = require("extensions.config.nvim-cmp"),
	}),

	-- parences
	vl({
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = require("extensions.config.nvim-surround"),
	}),
	vl({
		"andymass/vim-matchup",
		init = require("extensions.setup.vim-matchup"),
	}),

	-- Toggle numbers
	vl({
		"myusuf3/numbers.vim",
		event = { "InsertEnter" },
	}),

	-- Alt coutup/down
	{
		"monaqa/dial.nvim",
		keys = require("extensions.keys.dial"),
	},

	-- Alt StatusLine
	vl({
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
		config = require("extensions.config.lualine"),
	}),

	-- Noice!!
	vl({
		"rcarriga/nvim-notify",
		event = ev_noice,
		cmd = { "Notifications" },
		config = require("extensions.config.nvim-notify"),
	}),
	vl({
		"folke/noice.nvim",
		event = ev_noice,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = require("extensions.config.noice"),
	}),
	--- more good neovim ui
	vl({
		"stevearc/dressing.nvim",
		event = ev_noice,
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
		as = "nightfly",
	}),

	--- Todo Comments
	vl({
		"folke/todo-comments.nvim",
		event = ev_BufLazy,
		dependencies = "nvim-lua/plenary.nvim",
		keys = require("extensions.keys.todo-comments"),
		config = require("extensions.config.todo-comments"),
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

	-- Git
	vl({
		"lewis6991/gitsigns.nvim",
		config = require("extensions.config.gitsigns"),
	}),

	-- Languages
	--- Markdown
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- im-select
	{
		"keaising/im-select.nvim",
		event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter", "CursorHold" },
		enabled = vim.fn.executable("im-select") == 1,
		config = require("extensions.config.im-select"),
	},

	-- Calc startup time
	{
		"dstein64/vim-startuptime",
		cmd = { "StartupTime" },
	},
}
