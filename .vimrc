scriptencoding utf-8

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
set updatetime=300

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
set colorcolumn=100,120
set backspace=indent,eol,start
set signcolumn=yes

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
colorscheme solarized

let html_no_rendering = 1


augroup vimrc
    au!
    au VimEnter * redrawstatus!
augroup end


let g:lsc_server_commands = {
    \     'javascript': {
    \         'command': 'typescript-language-server --stdio',
    \         'log_level': -1,
    \         'suppress_stderr': v:true,
    \     }
    \ }
let g:lsc_auto_map = {
    \     'GoToDefinition': '<c-]>',
    \     'ShowHover': v:true,
    \     'Completion': 'omnifunc',
    \ }
let g:lsc_enable_autocomplete = v:true
let g:lsc_reference_highlights = v:false
let g:lsc_enable_diagnostics = v:false

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1

let g:airline_extensions = ['quickfix', 'term', 'ctrlp', 'fugitiveline', 'syntastic', 'tabline', 'keymap']
let g:airline_section_y = "%{airline#util#wrap(&fenc.' '.&ff,0)}"
let g:airline#extensions#syntastic#error_symbol = 'E: '
let g:airline#extensions#syntastic#stl_format_err = '%E{%fe #%e}'
let g:airline#extensions#syntastic#warning_symbol = 'W: '
let g:airline#extensions#syntastic#stl_format_warn = '%W{%fw #%w}'

let g:ctrlp_match_window = 'min:15,max:15'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -co --exclude-standard']
let g:ctrlp_user_command_async = 1
let g:ctrlp_match_current_file = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1r'

let g:splitjoin_curly_brace_padding = 1
let g:splitjoin_trailing_comma = 1

let g:gitgutter_map_keys = 0
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_sign_priority = 9

let g:prosession_dir = '~/.vim/dirs/session/'

let g:is_bash = 1

let g:sql_type_default = 'pgsql'
