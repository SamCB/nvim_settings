" No banner above the netrw window
let g:netrw_banner = 0
" Tree view
let g:netrw_liststyle = 3

function! s:toggleNetrw() abort
  if &filetype ==# 'netrw'
    execute ':b#'
  else
    execute ':e .'
  endif
endfunction

nmap <leader>f :call <SID>toggleNetrw()<CR>
nmap <leader>v :Vexplore!<CR>
nmap <leader>s :Hexplore<CR>

let g:netrw_list_hide = '^\.DS_Store$,^\.git/$'
let g:netrw_hide = 1
