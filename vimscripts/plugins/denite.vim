" A lot of this is from:
" https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim#L58

" Define mappings inside denite
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort

  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <tab>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <S-Tab>
  \ denite#do_map('toggle_select').'k'
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  imap <silent><buffer> <Esc>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <tab>
  \ denite#do_map('toggle_select').'j'
  inoremap <silent><buffer><expr> <S-Tab>
  \ denite#do_map('toggle_select').'k'
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

try
  " If using ripgrep
  if executable("rg")
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg'])
    " Custom options for ripgrep
    "   --vimgrep:  Show results with every match on it's own line
    "   --hidden:   Search hidden directories and files
    "   --heading:  Show the file name above clusters of matches from each file
    "   --S:        Search case insensitively if the pattern is all lowercase
    call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

    " Recommended defaults for ripgrep via Denite docs
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  call denite#custom#option('default', 'split', 'floating')
  call denite#custom#option('default', 'auto_resize', 1)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" Mappings
nmap <leader>pp :DeniteProjectDir -start-filter=1 file/rec<CR>
nmap <leader>pb :Denite -start-filter=1 buffer<CR>
nmap <leader>pg :Denite grep:. -no-empty<CR>
nmap <leader>pG :DeniteCursorWord grep:.<CR>
nmap <leader>p <leader>pp
