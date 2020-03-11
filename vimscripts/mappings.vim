let mapleader = ","

" Delete buffer without closing the window.
" https://stackoverflow.com/a/4468491/1112586
" https://stackoverflow.com/a/29179159/1112586
command! BD bp|bd #

" Clear current search (stupid XY solution for cleaning highlighting)
nmap <leader>/ :let @/ = ""<CR>

" :TF or :ToggleFold to enable or disable toggling of folds
" :TF s toggles using syntax mode
function! s:ToggleFolds(...)
  if (exists('b:fold_enabled') && b:fold_enabled == 1)
    set foldmethod=manual
    normal zE
    let b:fold_enabled = 0
    echo 'folding off'
  else
    set foldlevelstart=0
    if (a:0 > 0 && (a:1 == 's' || a:1 == 'syntax'))
      set foldmethod=syntax
    else
      set foldmethod=indent
    endif
    normal zM
    normal zv
    let b:fold_enabled = 1
    echo 'folding on'
  endif
endfunction

command! -nargs=* ToggleFold call <SID>ToggleFolds(<f-args>)
command! -nargs=* TF call <SID>ToggleFolds(<f-args>)

