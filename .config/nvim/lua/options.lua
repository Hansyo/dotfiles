local options = {
	number = true, -- 行数表示
	relativenumber = true, -- 相対行数表示
	scrolloff = 999,
	tabstop = 4,
	softtabstop = -1,
	shiftwidth = 0,
	autoindent = true, -- default enable
	smartindent = true,
	list = true, -- 不可視文字の可視化
	listchars = "tab:»-,eol:↲,extends:»,precedes:«,nbsp:%",
	mouse = "",
	incsearch = true,
	hlsearch = true,
	inccommand = "split",
	autochdir = true,
	clipboard = "unnamedplus",
	swapfile = false,
	spelllang = { "en", "cjk" },
	conceallevel = 0,
	splitbelow = true,
	splitright = true,
	laststatus = 3,
	fillchars = {
		horiz = "━",
		horizup = "┻",
		horizdown = "┳",
		vert = "┃",
		vertleft = "┫",
		vertright = "┣",
		verthoriz = "╋",
	},
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

local global_variables = {
	-- Disable default plugin: 変数が設定されていれば、良いので、値はなんでも良い
	loaded_tar = 1,
	loaded_tarPlugin = 1,
	loaded_zip = 1,
	loaded_zipPlugin = 1,
	loaded_gzip = 1,
	loaded_2html_plugin = 1,
	loaded_vimball = 1,
	loaded_vimballPlugin = 1,
	loaded_getscript = 1,
	loaded_getscriptPlugin = 1,
	loaded_man = 1,
	loaded_spellfile_plugin = 1,
	loaded_tutor_mode_plugin = 1,
	did_install_default_menus = 1,
	did_install_syntax_menus = 1,
	skip_loading_mswin = 1,
}

for k, v in pairs(global_variables) do
	vim.g[k] = v
end
