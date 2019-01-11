scriptencoding utf-8

" vimrcの保存先のデフォルト値
if !exists("g:vimrc_folder")
  let g:vimrc_folder = "~/.vim/rc/"
endif

" 設定ファイルの一覧を取得
function! GetSettingFiles ()
  if g:vimrc_folder =~ ".*/$"
    let g:filelist = expand(g:vimrc_folder . "*.vim")
  else
    let g:filelist = expand(g:vimrc_folder . "/*.vim")
  endif
  let g:filelist_split = split(g:filelist, "\n")
endfunction

" パターンにあった設定ファイルの呼び出し
function! SourceSettingFiles ()
  for s:filename in g:filelist_split
    if s:filename !~ ".*/.*_test\.vim"
      call feedkeys(":source ".s:filename."\<cr>")
    endif
  endfor
  call feedkeys("\<cr>") " 「続行するには...」を強制的に抜けるため
endfunction

call GetSettingFiles()
call SourceSettingFiles()
