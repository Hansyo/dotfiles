local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local transparentBgGrp = augroup("TransparentBG", { clear = true })
local transparentCommand = function(au_cmd_name)
	return {
		pattern = "nightfly",
		group = transparentBgGrp,
		command = string.format("highlight %s ctermbg=NONE guibg=NONE", au_cmd_name),
	}
end
autocmd("Colorscheme", transparentCommand("Normal"))
autocmd("Colorscheme", transparentCommand("NonText"))
autocmd("Colorscheme", transparentCommand("LineNr"))
autocmd("Colorscheme", transparentCommand("CursorLineNr"))
autocmd("Colorscheme", transparentCommand("Folded"))
autocmd("Colorscheme", transparentCommand("EndOfBuffer"))
autocmd("Colorscheme", transparentCommand("VertSplit"))
autocmd("Colorscheme", transparentCommand("WinBar"))
autocmd("Colorscheme", transparentCommand("WinBarNC"))

local highlightLineGrp = augroup("HighlightLine", { clear = true })
autocmd("Colorscheme", {
	pattern = "nightfly",
	group = highlightLineGrp,
	command = "highlight LineNr ctermfg=3 guifg=#909b1b",
})
autocmd("Colorscheme", {
	pattern = "nightfly",
	group = highlightLineGrp,
	command = "highlight CursorLineNr ctermfg=Yellow guifg=#f8fa1c",
})

local highlightLspGrp = augroup("HighlightLsp", { clear = true })
autocmd("Colorscheme", {
	pattern = "nightfly",
	group = highlightLspGrp,
	command = "highlight lspReference ctermfg=white guifg=#FFFFFF ctermbg=6 guibg=#008080",
})

vim.api.nvim_set_option("termguicolors", true)
vim.g.nightflyCursorColor = true
vim.g.nightflyUnderlineMatchParen = true
vim.g.nightflyTransparent = true
vim.g.nightflyUndercurls = true

vim.cmd([[ colorscheme nightfly ]])
