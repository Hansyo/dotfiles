scriptencoding utf-8

" ALEのエラー窓を常に表示(左側のあれ)
let g:als_sign_column_always = 1

" ALEの記号を変更
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" ステータスラインのフォーマットを変更
let g:ale_statusline_format = ['%d E', '%d W', 'Good Code!!']

" メッセージのフォーマットも(一時的に)変更
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'

" ついでに、QuickFixも使用する
" でないと、ファイル内のエラーの全体がぱっと把握できない
let g:ale_open_list = 1

" 特定のLintツールのみを有効にする
" let g:ale_linters = {'python': ['flake8'], 'cpp':['gcc']}
let g:ale_linters = {'python': ['flake8'], 'cpp' : ['g++']}
let g:ale_linters_ignore = {'python': ['pylint', 'mypy']}
" let g:ale_linters_explicit = 1

" mypyのimportエラーがあまりにも鬱陶しいので、オプションで強引に消す
let g:ale_python_mypy_options = '--ignore-missing-imports'

" 下に表示されるエラーの表示方法
let g:ale_echo_msg_format = '[%linter%: %code%] %s [%severity%]'

" c++のオプション
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

" vim-airline
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_enter = 0

