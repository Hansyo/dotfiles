scriptencoding utf-8

call plug#begin(stdpath('data') . '/plugged')

" gitのいいやつ
Plug 'airblade/vim-gitgutter'

" インデントの可視化
Plug 'Yggdroot/indentLine'

" 末尾の空白の可視化・削除
Plug 'bronson/vim-trailing-whitespace'

" vim-docの日本語化
Plug 'vim-jp/vimdoc-ja'

" vim-lsp
" Plug 'prabirshrestha/async.vim' "必要なくなったぽい
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" unite
Plug 'Shougo/unite.vim'

" nim.vim
Plug 'zah/nim.vim', {'for': 'nim'}

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-latex
Plug 'lervag/vimtex'

" vim-quickrun
Plug 'thinca/vim-quickrun'

" ColorScheme

call plug#end()

" vimrcを現状の方法で分割することに限界を感じた。
" 理由としては、新しく開いたバッファで設定がうまく反映されないことがあげられる。
" やっぱり、runtimepathを使うべきだと思うようになったので、改修を行う
set runtimepath+=~/.config/nvim/vim
runtime! ~/.config/nvim/vim rc/*.vim
