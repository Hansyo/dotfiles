local packer
local function init()
	if not packer then
		packer = require 'packer'
		packer.init {
			display = {
				open_fn = require('packer.util').float,
			},
		}
	end
	packer.reset()

	packer.use({
		'airblade/vim-gitgutter',        -- gitのいいやつ
		'Yggdroot/indentLine',           -- インデントの可視化
		'bronson/vim-trailing-whitespace', -- 末尾の空白の可視化・削除
		'vim-jp/vimdoc-ja',              -- vim-docの日本語化
		'christoomey/vim-tmux-navigator', -- Vim Tmux Navigator
		'tpope/vim-surround',            -- Vim surround

		-- LSP manager
		{
			'williamboman/mason.nvim',
			requires = { -- 正確にはrequiresではないけど、実質そうなので...
				'neovim/nvim-lspconfig',
				'mason-org/mason-registry',
			},
			config = function() require('extensions.mason') end,
		},
		{
			'williamboman/mason-lspconfig.nvim',
			config = function() require('extensions.mason-lspconfig') end,
		},

		-- -- Null-ls
		{
			'jay-babu/mason-null-ls.nvim',
			requires = {
				'williamboman/mason.nvim',
				'nvim-lua/plenary.nvim',
				'jose-elias-alvarez/null-ls.nvim',
			},
			config = function () require('extensions.null-ls') end
		},

		-- Tree Sitter
		{
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = function() require('extensions.nvim-treesitter') end,
		},
		{
			'nvim-treesitter/nvim-treesitter-context',
			requires = { 'nvim-treesitter/nvim-treesitter' },
			config = function() require('extensions.nvim-treesitter-context') end,
		},
		{
			'folke/twilight.nvim',
			requires = { 'nvim-treesitter/nvim-treesitter' },
			config = function() require('extensions.twilight') end,
		},

		-- 補完
		{
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/vim-vsnip',
				'onsails/lspkind.nvim',
			},
			config = function() require('extensions.nvim-cmp') end,
		},

		-- Airline
		'vim-airline/vim-airline',
		'vim-airline/vim-airline-themes',

		-- ColorScheme
		{
			'bluz71/vim-nightfly-colors',
			as = 'nightfly',
			config = function() require('extensions.airline') end,
		},

		-- Packer
		{ 'wbthomason/packer.nvim', opt = true },
	})
end

return setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})
