let mapleader = ","

" Delete buffer without closing the window.
" https://stackoverflow.com/a/4468491/1112586
" https://stackoverflow.com/a/29179159/1112586
command! BD bp|bd #

nmap <leader>/ :let @/ = ""<CR>
