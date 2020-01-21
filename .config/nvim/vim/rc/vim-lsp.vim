let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd']},
            \ 'whitelist': ['c', 'cpp'],
            \ })
