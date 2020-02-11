" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `g[` and `g]` to navigate diagnostics
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Locationlist/Quickfix windows
nmap <silent> <leader>l :lopen<CR>
nmap <silent> <leader>L :lclose<CR>
nmap <silent> <leader>q :copen<CR>
nmap <silent> <leader>Q :cclose<CR>
" The color for the line is quite difficult to read
hi QuickFixLine guibg=NONE

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Jump into the floating window, try to expand
function! s:bigFloatingWindow()
  if (coc#util#has_float())
    if (exists('w:coc_floating_window') && w:coc_floating_window == 1)
    " shrink and leave window
    let w:coc_floating_window = 0

    execute 'resize '.w:default_height
    execute 'vertical resize '.w:default_width

      wincmd w
    else
      " enter and expand window
      call coc#util#float_jump()
      let w:coc_floating_window = 1
      let w:default_width = winwidth(0)
      let w:default_height = winheight(0)

      180wincmd |
      20wincmd _

    endif
  endif
endfunction


nmap <leader>o :call <SID>bigFloatingWindow()<CR>

" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>cf  <Plug>(coc-fix-current)

" Need to set up pyx stuff properly
set pyxversion=3

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

