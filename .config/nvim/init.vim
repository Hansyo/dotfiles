" vimrc に以下のように追記

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" 以下から自分で組んで見る設定
" これであっているかどうかわからないことが多い

" NERDTreeの設定---------------------------------------
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

" 表示幅
let g:NERDTreeWinSize=50

" ブックマークを表示
let g:NERDTreeMapUpdir=''

" ファイルの開き方
let g:NERDTreeMapOpenSplit='<C-j>'
let g:NERDTreeMapOpenVSplit='<C-l>'

" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1

" 隠しファイルを表示
let g:NERDTreeShowHidden=1

" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']

" NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

" NERDTreeはここまで-----------------------------------

" プラグインはここまで-----------------------------------------

" 純粋な個人設定-----------------------------------------------
" カーソル行からの相対的な行表示
set number
set relativenumber
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

" カーソル行のある行を画面中央に表示
" Garaが教えてくれた！！ありがとう
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
nnoremap j jzz
nnoremap k kzz
nnoremap h hzz
nnoremap l lzz

let zz_movement = 0
function! Flag_zz_movement()
  if g:zz_movement == 0
    g:zz_movement = 1
    nnoremap j j
    nnoremap k k
    nnoremap h h
    nnoremap l l
  else
    g:zz_movement = 0
    nnoremap j jzz
    nnoremap k kzz
    nnoremap h hzz
    nnoremap l lzz
  fi
endfunction

nnoremap <F1> :Flag_zz_movement()<CR>

