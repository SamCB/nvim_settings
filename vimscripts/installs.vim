call plug#begin($CONFIG_DIR.'/plugged')

" Intellisense and full language server protocol!!!
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" Fuzzy finding and all that good stuff
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Nerdtree and everything good it brings.
Plug 'scrooloose/nerdtree'

" Colourscheme
Plug 'lifepillar/vim-solarized8'

" Airline is somewhat necessary for this to be called a vim config amiright?
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

execute 'source '.$CUSTOM_INSTALLS_FILE

call plug#end()
