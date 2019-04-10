" cのwatchdog設定
" let g:quickrun_config["javascript/watchdogs_checker"] = {
"   "type": "watchdogs_checker/gcc",
"   "cmdopt": "-Wall",
" }



" シンタックスチェックを行う
let g:quickrun_config = {}
call watchdogs#setup(g:quickrun_config)

" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1

" 一定時間キー入力がなかったときにシンタックスチェックを行う
" バッファに書き込み後、一度だけ行われる
let g:watchdogs_check_CursorHold_enable = 1
