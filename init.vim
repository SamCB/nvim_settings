let $CONFIG_DIR= "~/.config/nvim/"
let $VIMRC = $CONFIG_DIR . "/init.vim"
let $MYVIMDIR = "~/.nvim_settings/"

function! s:source_file(path, ...)
  let abspath = resolve($MYVIMDIR . '/' . a:path)
  execute 'source' fnameescape(abspath)
endfunction

call s:source_file("vimscripts/generated.vim")
call s:source_file("vimscripts/mappings.vim")
call s:source_file("vimscripts/global_settings.vim")
call s:source_file("vimscripts/installs.vim")

call s:source_file("vimscripts/plugins/solarized8.vim")
call s:source_file("vimscripts/plugins/coc_settings.vim")
call s:source_file("vimscripts/plugins/denite.vim")
call s:source_file("vimscripts/plugins/nerdtree.vim")
call s:source_file("vimscripts/plugins/airline.vim")
