" set linters
let g:ale_linters = {'python': ['flake8'], 'cpp' : ['g++']}

" set gcc option
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

" set symbol
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_sign_column_always = 1

" quickfix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" vim-airline
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_enter = 0

