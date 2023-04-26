local options = {
	number = true, -- 行数表示
	relativenumber = true, -- 相対行数表示
	scrolloff = 999,
	tabstop = 2,
	softtabstop = 2,
	autoindent = true,
	smartindent = true,
	shiftwidth = 2,
	list = true, -- 不可視文字の可視化
	listchars = 'tab:»-,eol:↲,extends:»,precedes:«,nbsp:%',
	mouse = '',
	incsearch = true,
	hlsearch = true,
	inccommand = 'split',
	autochdir = true,
	clipboard = 'unnamedplus',
	swapfile = false,
	spelllang = {'en', 'cjk'},
	conceallevel = 0,
	splitbelow = true,
	splitright = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
