set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin 'altercation/vim-colors-solarized'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'moll/vim-node'
Plugin 'walm/jshint.vim'
Plugin 'hdima/python-syntax'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'ternjs/tern_for_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
"Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'Yggdroot/indentLine'
Plugin 'w0rp/ale'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'uarun/vim-protobuf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" personal conf
syntax on
let mapleader = "\<Space>"
"color desert
if has('gui_running')
    set background=dark
    colorscheme solarized
    call togglebg#map("<F5>")
else
    colorscheme zenburn
endif

set t_Co=256
set nu
set nocursorline
hi cursorline cterm=bold
" disable bold font

set t_md=
set t_ti= t_te=
set laststatus=2
set nomodeline

let g:indentLine_color_term = 239

" if (exists('+colorcolumn'))
"     set colorcolumn=120
"     highlight ColorColumn ctermbg=gray
" endif

"" encodings configure
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,latin1
set fileformats=unix,dos,mac

"set ttymouse=xterm2
"set mouse=nv
"map <ScrollWheelUp> <C-Y>
"map <S-ScrollWheelUp> <C-U>
"map <ScrollWheelDown> <C-E>
"map <S-ScrollWheelDown> <C-D>

""wildignore
set wildmenu "Turn on WiLd menu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*
set wildignore+=./node_modules/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
"set noswapfile
set directory=$HOME/.vim/swapfiles//
" reopening a file
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" make backspace work like most other apps
set backspace=2

"" set tabstop value and shift width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set incsearch
hi IncSearch cterm=NONE ctermfg=NONE ctermbg=darkgrey
hi Search cterm=NONE ctermfg=NONE ctermbg=darkgrey

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/

set completeopt=menuone,longest

"" Cold Folding
set foldmethod=indent
set foldlevelstart=100
set foldlevel=99

"" Define custom indentation for filetypes
autocmd FileType javascript :setlocal sw=4 ts=4 sts=4
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType json :setlocal sw=2 ts=2 sts=2

" -------------------------------------
" unite conf
nnoremap <leader>b :<C-u>Unite buffer<cr>
nnoremap <leader>f :<C-u>Unite -start-insert file<cr>
nnoremap <leader><space> :<C-u>Unite -start-insert file_rec<cr>
nnoremap gf :sp<cr> yaw :<C-u>Unite -start-insert file_rec<cr><C-r>"<ESC>

map <leader>c :ALEToggle<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_php_phpmd_ruleset = "design,naming,unusedcode"
let g:ale_python_flake8_args = "--ignore=E402 --max-line-length=160"

let g:go_metalinter_deadline = "60s"
let g:ale_linters = {'go': ['gometalinter']}

nnoremap <leader>i :IndentLinesToggle<cr>

let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 32
map tr :NERDTreeToggle<cr>
let NERDTreeIgnore = ['.*\.o$','.*\.ko$','.*\.gz$', '.*\.pyc', '.*\.gitignore', '.DS_Store', '__pycache__']

map tb :Tagbar<cr>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 26
let g:tagbar_left= 1
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
  \ ]
\ }

" for python
let python_highlight_all = 1

" for json
let g:vim_json_warnings=0

let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0

let g:jedi#show_call_signatures = "1"

let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

let g:ack_use_dispatch = 1
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>/ * :Ack -w <C-r><C-w><cr>
