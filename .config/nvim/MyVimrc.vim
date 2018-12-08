" カーソル行からの相対的な行表示
set number
set relativenumber
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

" カーソル行のある行を画面中央に表示
" @が教えてくれた！！ありがとう
" カーソルから何行下を強制的に開けるかを設定しているらしい
" あとでトグルにできるようにする
set scrolloff=0
 
nnoremap <F4> :let &scrolloff=1000-&scrolloff<CR>

" タブ・インデント
set tabstop=2     " タブ幅
set softtabstop=2
set autoindent    " 自動インデント
set smartindent   " 構文チェックしてインデント
set shiftwidth=2  " smartindentで増減する幅
set expandtab     " インデントを行う場合、スペースで埋める

" 文字列検索
set incsearch  " インクリメンタルサーチ。 1文字ごとに検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase  " 検索パターンに大文字を含んでいたら区別する
set hlsearch   " 検索結果をハイライト
nnoremap <silent><Esc><Esc> :noh<CR>
" 移動方法の選択

" @rbtnnさんに教えてもらった方法
augroup always-center
  autocmd!
  autocmd CursorMoved * :call feedkeys('zz', 'n')
augroup END
" を関数化して、トグルできるようにした方法
let g:always_center_flag = 1
function! Always_center_toggle()
  if g:always_center_flag == 1
    let g:always_center_flag = 0
    augroup always-center
      autocmd!
    augroup END
  else
    let g:always_center_flag = 1
    augroup always-center
      autocmd!
      autocmd CursorMoved * :call feedkeys('zz', 'n')
    augroup END
  endif
endfunction

" 非効率的な方法
" nnoremap j jzz
" nnoremap k kzz
" nnoremap h hzz
" nnoremap l lzz
" let zz_movement = 0
"function! Flag_zz_movement()
"  if g:zz_movement == 0
"    g:zz_movement = 1
"    nnoremap j j
"    nnoremap k k
"    nnoremap h h
"    nnoremap l l
"  else
"    g:zz_movement = 0
"    nnoremap j jzz
"    nnoremap k kzz
"    nnoremap h hzz
"    nnoremap l lzz
"  fi
"endfunction

nnoremap <F1> :call Always_center_toggle()<CR>

" 今開いているファイルの場所を自動的にカレントディレクトリにしてくれる
set autochdir

" clipboardとの連携
set clipboard+=unnamedplus
