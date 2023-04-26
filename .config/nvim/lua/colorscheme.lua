local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local transparentBgGrp = augroup('TransparentBG', {clear = true})
autocmd('Colorscheme', { pattern = '*', group = transparentBgGrp, command = 'highlight Normal ctermbg=NONE guibg=NONE'})
autocmd('Colorscheme', { pattern = '*', group = transparentBgGrp, command = 'highlight NonText ctermbg=NONE guibg=NONE'})
autocmd('Colorscheme', { pattern = '*', group = transparentBgGrp, command = 'highlight LineNr ctermbg=NONE guibg=NONE'})
autocmd('Colorscheme', { pattern = '*', group = transparentBgGrp, command = 'highlight CursorLineNr ctermbg=NONE guibg=NONE'})
autocmd('Colorscheme', { pattern = '*', group = transparentBgGrp, command = 'highlight Folded ctermbg=NONE guibg=NONE'})
autocmd('Colorscheme', { pattern = '*', group = transparentBgGrp, command = 'highlight EndOfBuffer ctermbg=NONE guibg=NONE'})

local highlightLineGrp = augroup('HighlightLine', {clear = true})
autocmd('Colorscheme', { pattern = '*', group = highlightLineGrp, command = 'highlight LineNr ctermfg=3 guifg=#909b1b'})
autocmd('Colorscheme', { pattern = '*', group = highlightLineGrp, command = 'highlight CursorLineNr ctermfg=Yellow guifg=#f8fa1c'})

local highlightLspGrp = augroup('HighlightLsp', {clear = true})
autocmd('Colorscheme', { pattern = '*', group = highlightLspGrp, command = 'highlight lspReference ctermfg=white guifg=#FFFFFF ctermbg=6 guibg=#008080'})

vim.api.nvim_set_option('termguicolors', true)
vim.g.nightflyCursorColor = true
vim.g.nightflyUnderlineMatchParen = true
vim.g.nightflyTransparent = true
vim.g.airline_theme = 'nightfly'

vim.cmd [[ colorscheme nightfly ]]
