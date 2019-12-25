call plug#begin($MYVIMDIR.'/plugged')

" Intellisense and full language server protocol!!!
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nerdtree and everything good it brings.
Plug 'scrooloose/nerdtree'

call plug#end()

so vimscripts/plugins/coc_settings.vim
so vimscripts/plugins/nerdtree.vim
