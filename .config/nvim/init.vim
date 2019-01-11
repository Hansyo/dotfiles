scriptencoding utf-8

" 自作のvimrcローダー
" init-loader.elっぽくしたかったけど、
" 正規表現の比較で、アトム化が行えなかったため断念。
" なんでなんだろ...
" あと、ロードされるまでに間がある
let g:vimrc_folder = "~/.config/nvim/vim/rc"
source ~/.config/nvim/loader.vim
