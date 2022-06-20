" vimのruntimepathの設定
set runtimepath+=~/.vim

" カーソル行からの相対的な行表示
set number
set relativenumber
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

" カーソル行のある行を画面中央に表示 @GarActが教えてくれた！！ありがとう
" カーソルから何行下を強制的に開けるかを設定しているらしい
" トグルできるようにした
set scrolloff=999

" タブ・インデント
" 基本的に自動的に設定される(本当?)ため、全てコメントアウトすべき
" 変えたかったら$VIMRUNTIMEを~/.vimにコピってから
" export VIMRUNTIME=~/.vim
" を.zshrcなりですること
set tabstop=2     " タブ幅
set softtabstop=2
set autoindent    " 自動インデント
set smartindent   " 構文チェックしてインデント
set shiftwidth=2  " smartindentで増減する幅
" set expandtab     " インデントを行う場合、スペースで埋める
" Makefileのみタブを挿入
" let _curfile = expand("%:r")
" if _curfile == 'makefile'
"   set noexpandtab
" endif
" 不可視文字の可視化
set list
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%

" 文字列検索
set incsearch  " インクリメンタルサーチ。 1文字ごとに検索を行う
"set ignorecase " 検索パターンに大文字小文字を区別しない
"set smartcase  " 検索パターンに大文字を含んでいたら区別する
set hlsearch   " 検索結果をハイライト
set inccommand=split
"search結果のハイライトを消す
nnoremap <silent><Esc><Esc> :noh<CR>


" 移動方法の選択

"" @rbtnnさんに教えてもらった方法
"augroup always-center
"  autocmd!
"  autocmd CursorMoved * :call feedkeys('zz', 'n')
"augroup END
" を関数化して、トグルできるようにした方法
let g:always_center_flag = 1
function! Always_center_toggle()
  if g:always_center_flag == 1
    let g:always_center_flag = 0
    set so=0
    "augroup always-center
    "  autocmd!
    "augroup END
  else
    let g:always_center_flag = 1
    set so=999
    "augroup always-center
    "  autocmd!
    "  autocmd CursorMoved * :call feedkeys('zz', 'n')
    "augroup END
  endif
endfunction

nnoremap <F1> :call Always_center_toggle()<CR>

" 今開いているファイルの場所を自動的にカレントディレクトリにしてくれる
set autochdir

" clipboardとの連携
set clipboard+=unnamedplus

" スワップファイルを使わない設定にする
set noswapfile

" helpの言語設定
" set helplang=ja,en

" vimのruntimepathの設定
set runtimepath+=/home/hansy/.vim

" spell check機能の対象言語の設定
set spelllang=en,cjk

colorscheme elflord

" concealを無効化
set conceallevel=0

" LeaderをSpaceに設定
let mapleader = "\<Space>"
