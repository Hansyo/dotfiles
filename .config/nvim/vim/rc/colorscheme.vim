" elflord
"colorscheme elflord

" hatsunemiku
"colorscheme hatsunemiku
"let g:airline_theme = 'hatsunemiku'


" tokyonight
"let g:tokyonight_style = 'night' " available: night, storm
"colorscheme tokyonight
"let g:airline_theme = 'tokyonight'

" papercolor-theme
"set background=dark
"colorscheme PaperColor
"let g:airline_theme='papercolor'

" moonfly
"colorscheme moonfly
"let g:airline_theme='moonfly'
"" 青文字が見づらい
"" 文字選択したときの表示がない

" nightfly
set termguicolors
"" DO SETTING BEFORE LOAD COLORSCHEME
let g:nightflyCursorColor = 1
let g:nightflyUnderlineMatchParen = 1
let g:nightflyTransparent = 1
let g:airline_theme='nightfly'

colorscheme nightfly

" kanagawa
" set termguicolors
" colorscheme kanagawa

" Other settings
"" 背景を透過させるための設定
augroup TransparentBG
	autocmd!
	autocmd Colorscheme * highlight Normal ctermbg=NONE guibg=NONE
	autocmd Colorscheme * highlight NonText ctermbg=NONE guibg=NONE
	autocmd Colorscheme * highlight LineNr ctermbg=NONE guibg=NONE
	autocmd Colorscheme * highlight CursorLineNr ctermbg=NONE guibg=NONE
	autocmd Colorscheme * highlight Folded ctermbg=NONE guibg=NONE
	autocmd Colorscheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
augroup END

"" 行番号の色を選択行は黄色、それ以外は薄い黄色に変える
augroup HighlightLine
	autocmd!
	autocmd Colorscheme * highlight LineNr ctermfg=3 guifg=#909b1b
	autocmd Colorscheme * highlight CursorLineNr ctermfg=Yellow guifg=#f8fa1c
augroup END
