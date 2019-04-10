scriptencoding utf-8
" deinは流石に手動で読み込ませる
source ~/.config/nvim/dein.vim

" 自作のvimrcローダー
" init-loader.elっぽくしたかったけど、
" 正規表現の比較で、アトム化が行えなかったため断念。
" なんでなんだろ...
" あと、ロードされるまでに間がある
" " 設定ファイルをおいてある場所を指定する
let g:vimrc_folder = "~/.config/nvim/vim/rc"
source ~/.config/nvim/loader.vim

" 何故か、sessionから読み込むと設定に失敗することがある。
" 解決方法はどこか(四畳半並感)

