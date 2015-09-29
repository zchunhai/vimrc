set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" personal conf
set background=dark
colorscheme solarized

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

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
