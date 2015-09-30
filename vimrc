set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'moll/vim-node'
Bundle 'walm/jshint.vim'
Bundle 'godlygeek/tabular'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'marijnh/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" personal conf
colorscheme evening
set cursorline

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

"" encodings configure
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,latin1
set fileformats=unix,dos,mac

""wildignore
set wildmenu "Turn on WiLd menu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

"" set tabstop value and shift width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set incsearch

"" Cold Folding
set foldmethod=indent
set foldlevelstart=100

"" Define custom indentation for filetypes
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType jade :setlocal sw=2 ts=2 sts=2
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType coffee :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby,eruby :setlocal sw=2 ts=2 sts=2

" -------------------------------------
" unite conf
nnoremap <space>f :<C-u>Unite -start-insert file<cr>
nnoremap <space><space> :<C-u>Unite -start-insert file_rec<cr>

" syntastic conf
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python"] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
map <F7> :SyntasticCheck<cr>

let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 26
map tr :NERDTreeToggle<cr>

map tb :Tagbar<cr>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 26
let g:tagbar_left= 1

nmap <space>= :Tabularize /=<CR>
vmap <space>= :Tabularize /=<CR>
nmap <space>=: :Tabularize /:\zs<CR>
vmap <space>=: :Tabularize /:\zs<CR>

" for python
Bundle 'hdima/python-syntax'
let python_highlight_all = 1
