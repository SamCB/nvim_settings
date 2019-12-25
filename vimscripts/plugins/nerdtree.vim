let g:NERDTreeWinPos = "left"
let g:NERDTreeShowHidden=1

" Autoshow when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd p | endif

map <leader>nf :NERDTreeFocus<CR>
