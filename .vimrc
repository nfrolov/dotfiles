scriptencoding utf-8

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on


set encoding=utf-8
set nobomb
set termencoding=utf-8
set ttyscroll=0
set ttyfast
set lazyredraw
set ttimeout
set ttimeoutlen=50

set hidden
set swapfile
set directory=~/.vim/dirs/swap//
set undofile
set undodir=~/.vim/dirs/undo//
set history=100
set undolevels=200
set sessionoptions-=blank
set sessionoptions-=options
set autoread

set title
set shortmess=a
set laststatus=2
set showcmd
set noshowmode
set ruler
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,*.out,*.jpg,*.png,*.gif,*.png
set wildignore+=**/node_modules/*,**/bower_components/*

set ffs=unix,dos,mac
set list
set listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:+ " ,eol:↲
set nowrap
set linebreak
set formatoptions+=j

set number
set autoindent
set shiftround
set nrformats-=octal
set colorcolumn=80,100
set backspace=indent,eol,start

set scrolloff=5
set sidescrolloff=5
set splitbelow
set splitright

set incsearch
set ignorecase
set smartcase
set hlsearch


let mapleader = ","

nnoremap <expr> gV '`['.getregtype()[0].'`]'

nnoremap <silent> <leader>/ :let @/=""<cr>

nnoremap Q <nop>
nnoremap gQ <nop>


set background=dark
set t_ut=
let g:solarized_termtrans=1
let g:solarized_visibility="normal"
let g:colarized_contrast="normal"
let g:colarized_hitrail=1
colorscheme solarized

let html_no_rendering = 1


augroup vimrc
    au!
    au VimEnter * redrawstatus!
    au FileType vim,php setlocal et sts=4 sw=4
    au FileType html,xml,css,scss,javascript,json,jade setlocal et sts=2 sw=2
augroup end


let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_stl_format = '%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_y = "%{airline#util#wrap(&fenc.' '.&ff,0)}"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:ctrlp_match_window = 'min:15,max:15'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -co --exclude-standard']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1r'

let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_modified_removed = '~̲'

let g:prosession_dir = '~/.vim/dirs/session/'

let g:jsx_ext_required = 0
