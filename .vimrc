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

set title
set shortmess=a
set laststatus=2
set noshowcmd
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

set number
set autoindent
set shiftround
set nrformats-=octal
set colorcolumn=80

set scrolloff=1
set sidescrolloff=5
set splitbelow
set splitright

set incsearch
set ignorecase
set smartcase
set hlsearch


let mapleader = ","

set pastetoggle=<f8>
nnoremap <silent> <f8> :set paste!<cr>

nnoremap <f5> :setlocal et ai si ts=2 sts=2 sw=2<cr>
nnoremap <f6> :setlocal noet noai nosi ts=4 sts=4 sw=4<cr>
nnoremap <f7> :setlocal noet noai nosi ts=8 sts=8 sw=8<cr>

nnoremap <expr> gV '`['.getregtype()[0].'`]'

nnoremap <silent> <leader>/ :let @/=""<cr>
nnoremap <silent> <leader>ff :CtrlP<cr>
nnoremap <silent> <leader>fb :CtrlPBuffer<cr>
nnoremap <silent> <leader>fm :CtrlPMixed<cr>
nnoremap <silent> <leader>ll :set modifiable!<cr>

nnoremap Q <nop>
nnoremap gQ <nop>


set background=dark
set t_Co=256
set t_ut=
let g:solarized_termtrans=1
let g:solarized_visibility="normal"
let g:colarized_contrast="normal"
let g:colarized_hitrail=1
colorscheme solarized

let html_no_rendering = 1
highlight! link SignColumn Ignore


augroup vimrc
    au!
    au VimEnter * redrawstatus!
    au BufRead,BufNewFile .{eslintrc,babelrc} setfiletype json
    au FileType vim,php setlocal et sts=4 sw=4
    au FileType html,xml,css,scss,javascript,json,jade setlocal et sts=2 sw=2
    au FileType scss setlocal commentstring=//\ %s
augroup end


let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_stl_format = '%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_y = "%{airline#util#wrap(&fenc.' '.&ff,0)}"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:ctrlp_match_window = 'min:10,max:10'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

let g:gitgutter_sign_column_always = 1

let g:prosession_dir = '~/.vim/dirs/session/'
