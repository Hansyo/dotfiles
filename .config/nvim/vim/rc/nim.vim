augroup filetype_of_nim
  autocmd!
  autocmd BufRead,BufNewFIle *.nim setfiletype nim
augroup END

function! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef<cr>
ino <M-g> <esc> :call JumpToDef()<cr>i
