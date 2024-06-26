-- luaで書いた設定の高速化
vim.loader.enable()

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keybindings")
require("lsp")
require("commands")
-- require("lazy").setup("packages")
require("lazy").setup("plugins")

if not vim.g.vscode then
	-- パッケージからカラースキームを読み込むため、lazyの後に持ってくる
	require("colorscheme")
end
