let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0

augroup MyGitGutterHighlight
				autocmd!
				autocmd VimEnter,ColorScheme * highlight GitGutterLineDefault ctermbg=23
				autocmd VimEnter,ColorScheme * highlight GitGutterAddLine          ctermbg=23
				autocmd VimEnter,ColorScheme * highlight GitGutterChangeLine       ctermbg=23
				autocmd VimEnter,ColorScheme * highlight GitGutterDeleteLine       ctermbg=90
				autocmd VimEnter,ColorScheme * highlight GitGutterChangeDeleteLine ctermbg=23
				autocmd VimEnter,ColorScheme * highlight clear SignColumn
augroup END
