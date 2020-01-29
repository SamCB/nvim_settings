" Put NERDTree to the left
let g:NERDTreeWinPos = "left"
" Show hidden files and directories
let g:NERDTreeShowHidden = 1
" Clean up the UI a bit
let g:NERDTreeMinimalUI = 1

" Ignore some specific files
let g:NERDTreeIgnore = ['^\.DS_Store$', '\.git$[[dir]]']

" Autoshow when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd p | endif

map <leader>nf :NERDTreeFocus<CR>
