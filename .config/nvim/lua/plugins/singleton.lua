local function vl(pkg)
	pkg = { pkg }
	pkg.event = { "VeryLazy" }
	return pkg
end

return {
	vl("christoomey/vim-tmux-navigator"),
	vl("nvim-lua/plenary.nvim"), -- いろんな奴らの依存プラグイン
	vl("vim-jp/vimdoc-ja"),
	vl("tpope/vim-repeat"), -- Expand dot repeat
}
