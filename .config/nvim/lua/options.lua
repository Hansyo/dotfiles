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
	listchars = "tab:┋-,eol:↲,extends:»,precedes:«,nbsp:%",
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
	laststatus = 2,
	fillchars = {
		-- 全体的に太めの線に変更
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
	loaded_tar = 0,
	loaded_tarPlugin = 0,
	loaded_zip = 0,
	loaded_zipPlugin = 0,
	loaded_gzip = 0,
	loaded_2html_plugin = 0,
	loaded_vimball = 0,
	loaded_vimballPlugin = 0,
	loaded_getscript = 0,
	loaded_getscriptPlugin = 0,
	loaded_man = 0,
	loaded_spellfile_plugin = 0,
	loaded_tutor_mode_plugin = 0,
	loaded_ruby_provider = 0,
	loaded_node_provider = 0,
	loaded_perl_provider = 0,
	did_install_default_menus = 1,
	did_install_syntax_menus = 1,
	skip_loading_mswin = 1,
}

if vim.fn.filereadable(vim.env.PYENV_ROOT .. "/versions/neovim3/bin/python") == 1 then
	global_variables.python3_host_prog = "$PYENV_ROOT/versions/neovim3/bin/python"
end

for k, v in pairs(global_variables) do
	vim.g[k] = v
end
