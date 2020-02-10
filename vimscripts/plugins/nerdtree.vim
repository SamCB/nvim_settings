" Put NERDTree to the left
let g:NERDTreeWinPos = "left"
" Show hidden files and directories
let g:NERDTreeShowHidden = 1
" Clean up the UI a bit
let g:NERDTreeMinimalUI = 1
" Close on open
let g:NERDTreeQuitOnOpen = 1

" Ignore some specific files
let g:NERDTreeIgnore = ['^\.DS_Store$', '\.git$[[dir]]']

function! s:SoftNerdTree() abort
  if bufname('%') =~# "^NERD_tree_"
    call <SID>SoftNerdTreeExit()
  else
    execute "NERDTreeFind"
    autocmd! BufLeave NERD_tree_* call <SID>SoftNerdTreeExit()
  endif
endfunction

function! s:SoftNerdTreeExit() abort
  autocmd! BufLeave NERD_tree_*
  execute "NERDTreeToggle"
endfunction

map <leader>nf :NERDTreeFocus<CR>
map <leader>f :call <SID>SoftNerdTree()<CR>
