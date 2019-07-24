" emacsライクなキーバインド
" <C-SPACE>でビジュアルモードとか、
" <C-e>で行末、<C-a>で行頭とか

nnoremap <silent><C-SPACE> v
nnoremap <silent><C-x><Space> <C-V>

nnoremap <C-e> $
nnoremap <C-a> ^
nnoremap <C-S-a> 0

nnoremap t <C-w>

nnoremap j gj
nnoremap k gk

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" jjでエスケープ
inoremap <silent> jj <ESC>

" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>
