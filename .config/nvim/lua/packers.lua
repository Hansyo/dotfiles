local packer
local function init()
	if not packer then
		packer = require("packer")
		packer.init({
			display = {
				open_fn = require("packer.util").float,
			},
		})
	end
	packer.reset()

	-- Managed Packages
	local ev_BufLazy = { "BufRead", "BufNewFile", "VimEnter" }
	local ll_cursor = function(pkg)
		pkg.event = { "CursorHold" }
		return pkg
	end
	local ll_BR_BNF = function(pkg)
		pkg.event = { "BufReadPost", "BufNewFile" }
		return pkg
	end

	packer.use({
		"christoomey/vim-tmux-navigator",
		"nvim-lua/plenary.nvim", -- いろんな奴らの依存プラグイン
		ll_cursor({ "Yggdroot/indentLine" }),
		ll_cursor({ "bronson/vim-trailing-whitespace" }),
		ll_cursor({ "vim-jp/vimdoc-ja" }),
		ll_BR_BNF({ "tpope/vim-repeat" }), -- Expand dot repeat
	})

	-- LSP
	packer.use({
		"williamboman/mason.nvim",
		event = ev_BufLazy,
		module = { "mason-core" },
		requires = {
			{ "neovim/nvim-lspconfig",             opt = true, module = "lspconfig" },
			{ "mason-org/mason-registry",          opt = true, event = ev_BufLazy },
			{ "williamboman/mason-lspconfig.nvim", opt = true, module = "mason-lspconfig" },
		},
		config = require("extensions.config.mason"),
	})

	--- LSPの状態を表示するやつ。軽いので、lazy load は不要。
	packer.use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})

	packer.use({
		"glepnir/lspsaga.nvim",
		opt = true,
		branch = "main",
		event = "LspAttach",
		setup = require("extensions.setup.lspsaga"),
		config = require("extensions.config.lspsaga"),
		requires = {
			{ "nvim-tree/nvim-web-devicons",    opt = true },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- -- Null-ls
	packer.use({
		"jay-babu/mason-null-ls.nvim",
		module = { "mason-null-ls" },
		event = ev_BufLazy,
		requires = { "mason.nvim" },
		-- config -> null-lsに併記
	})
	packer.use({
		"jose-elias-alvarez/null-ls.nvim",
		event = ev_BufLazy,
		requires = { "nvim-lua/plenary.nvim" },
		after = { "mason-null-ls.nvim", "mason.nvim" },
		config = require("extensions.config.null-ls"),
	})

	-- Snippet
	packer.use({
		"hrsh7th/vim-vsnip",
		event = { "InsertEnter" },
		requires = {
			{ "hrsh7th/vim-vsnip-integ",      event = { "InsertEnter" } },
			{ "rafamadriz/friendly-snippets", event = { "InsertEnter" } },
		},
		config = require("extensions.config.vim-vsnip"),
	})

	-- Tree Sitter
	packer.use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = require("extensions.config.nvim-treesitter"),
	})
	packer.use({
		"folke/twilight.nvim",
		cmd = { "Twilight" },
		keys = { "<Plug>(TwilightToggle)" },
		requires = {
			"nvim-treesitter/nvim-treesitter",
			cmd = { "Twilight" },
			keys = { "<Plug>(TwilightToggle)" },
		},
		setup = require("extensions.setup.twilight"),
		config = require("extensions.config.twilight"),
	})

	-- Easy Search
	packer.use({
		"hrsh7th/vim-searchx",
		fn = "searchx#*",
		setup = require("extensions.setup.vim-searchx"),
		config = require("extensions.config.vim-searchx"),
	})

	packer.use({
		"skanehira/jumpcursor.vim",
		setup = require("extensions.setup.jumpcursor"),
		keys = { "<Plug>(jumpcursor-jump)" },
	})

	-- Telescope
	packer.use({
		"nvim-telescope/telescope.nvim",
		module = { "telescope" },
		cmd = { "Telescope" },
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "rcarriga/nvim-notify", opt = true },
		},
		setup = require("extensions.setup.telescope"),
		config = require("extensions.config.telescope"),
	})

	-- 補完
	local ev_Ins = function(requires)
		for i = 1, #requires do
			if requires[i].event == nil then
				requires[i].event = { "InsertEnter" }
			else
				table.insert(requires[i].event, "InsertEnter")
			end
		end
		return requires
	end
	local cmp_requires = {
		{ "hrsh7th/cmp-nvim-lsp",               module = { "cmp_nvim_lsp" } },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-vsnip" },
		{ "hrsh7th/vim-vsnip" },
		{ "onsails/lspkind.nvim",               module = { "lspkind" } },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-cmdline",                event = { "CmdlineEnter" } },
	}
	packer.use({
		"hrsh7th/nvim-cmp",
		module = { "cmp" },
		requires = ev_Ins(cmp_requires),
		config = require("extensions.config.nvim-cmp"),
	})

	-- parences
	packer.use(ll_BR_BNF({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = require("extensions.config.nvim-surround"),
	}))
	packer.use({
		"andymass/vim-matchup",
		setup = require("extensions.setup.vim-matchup"),
	})

	-- Toggle numbers
	packer.use({
		"myusuf3/numbers.vim",
		event = { "InsertEnter" },
	})

	-- Alt coutup/down
	packer.use({
		"monaqa/dial.nvim",
		keys = { "<Plug>(dial-increment)", "g<Plug>(dial-decrement)" },
		setup = require("extensions.setup.dial"),
	})

	-- Alt StatusLine
	packer.use({
		"nvim-lualine/lualine.nvim",
		requires = {
			{ "nvim-tree/nvim-web-devicons", opt = true },
			{ "lewis6991/gitsigns.nvim",     opt = true },
		},
		config = require("extensions.config.lualine"),
	})

	-- Noice!!
	local ev_noice = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" }
	packer.use({
		"rcarriga/nvim-notify",
		event = ev_noice,
		module = { "notify" },
		cmd = { "Notifications" },
		config = require("extensions.config.nvim-notify"),
	})
	packer.use({
		"folke/noice.nvim",
		event = ev_noice,
		module = { "noice" },
		requires = {
			{ "MunifTanjim/nui.nvim", event = ev_noice },
			{ "rcarriga/nvim-notify", opt = true },
		},
		config = require("extensions.config.noice"),
	})

	-- Highlights
	--- Colorscheme
	packer.use({
		"bluz71/vim-nightfly-colors",
		as = "nightfly",
	})

	--- Todo Comments
	packer.use({
		"folke/todo-comments.nvim",
		event = ev_BufLazy,
		requires = "nvim-lua/plenary.nvim",
		setup = require("extensions.setup.todo-comments"),
		config = require("extensions.setup.todo-comments"),
	})

	--- Colorcode
	packer.use({
		"norcalli/nvim-colorizer.lua",
		cmd = {
			"ColorizerToggle",
			"ColorizerAttachToBuffer",
			"ColorizerDetachFromBuffer",
			"ColorizerReloadAllBuffers",
		},
	})

	-- QuickFIX
	--- quick-scope
	packer.use(ll_cursor({
		"unblevable/quick-scope",
		setup = require("extensions.setup.quick-scope"),
	}))

	--- nvim-bqf
	packer.use({
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		requires = {
			{ "nvim-treesitter/nvim-treesitter", opt = true },
		},
	})

	-- Git
	packer.use(ll_cursor({
		"lewis6991/gitsigns.nvim",
		config = require("extensions.config.gitsigns"),
	}))

	-- Languages
	--- Markdown
	packer.use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Packer
	packer.use({ "wbthomason/packer.nvim", opt = true })

	-- Calc startup time
	packer.use({
		"dstein64/vim-startuptime",
		cmd = { "StartupTime" },
	})
end

return setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})
