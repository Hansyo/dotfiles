return function()
	vim.cmd([[
let g:searchx = {}

" Auto jump if the recent input matches to any marker.
let g:searchx.auto_accept = v:true

" The scrolloff value for moving to next/prev.
let g:searchx.scrolloff = &scrolloff

" To enable scrolling animation.
let g:searchx.scrolltime = 0

" To disable auto nohlsearch after cursor is moved
let g:searchx.nohlsearch = {}
let g:searchx.nohlsearch.jump = v:false

" Marker characters.
let g:searchx.markers = split('ASDFGHJKLQWERTYUIOPZXCVBNM', '.\zs')

" Convert search pattern.
function g:searchx.convert(input) abort
  if a:input !~# '\k'
    return '\V' .. a:input
  endif
  return a:input[0] .. substitute(a:input[1:], '\\\@<! ', '.\\{-}', 'g')
endfunction
]])
end
