call plug#begin($CONFIG_DIR.'/plugged')

" Intellisense and full language server protocol!!!
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finding and all that good stuff
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Nerdtree and everything good it brings.
Plug 'scrooloose/nerdtree'

" Colourscheme
Plug 'lifepillar/vim-solarized8'

call plug#end()
