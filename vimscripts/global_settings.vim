
set hidden          " Hide buffers when abandoned instead of unload

" General formatting (whitespaces and line numbers)
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list
set number          " Show line numbers
set wrap
set linebreak       " Break lines at word 
set showbreak=>>>   " Wrap-broken line prefix
set showmatch       " Highlight matching brace
set matchpairs+=<:> " Add HTML brackets to pair matching
 
" Searching behaviour
set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set ignorecase      " Always case-insensitive
set incsearch       " Searches for strings incrementally
set infercase       " Adjust case in insert completion mode
set wrapscan        " Search wraps around end of file
set wildignore+=**/node_modules/** " Things to ingore when searching
 
" Default indent settings
set autoindent      " Auto-indent new lines
set expandtab       " Tabs as space
set shiftwidth=2    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab

" Specific intent settings
autocmd Filetype go setlocal ts=4 sw=4 noexpandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
 
" Movement
set splitbelow splitright " move the cursor to the window just split
set nofoldenable " Turn off folding

" Display
" Enables 24-bit RGB color in the TUI
if has('termguicolors')
    set termguicolors
endif

" Misc
set history=1000
set undolevels=1000             " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
