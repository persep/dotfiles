let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will me downloaded under the specified directory.
"
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"if inside any 256-color terminal
if &term =~ '256color'
    set t_ut=                               "disable Background Color Erase
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  "set foreground color for true colors
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  "set background color for true colors
    set termguicolors                       "Enable 24-bit RGB true color in vim 8
endif

set number          "Precede each line with its line number
set smartindent     "Do smart autoindenting when starting a new line
set autoindent      "Copy indent from current line when starting a new line
set shiftwidth=4    "Number of spaces to use for (auto)indent
set tabstop=4       "Number of space per tab
set softtabstop=4   "number of spaces in tab when editing
set expandtab       "use spaces for a tab
set cursorline      "highlight current line
set showmatch       "highlight matching [{()}]
set incsearch       "search as characters are entered
set hlsearch        "highlight matches
set noshowmode      "disable default mode indicator, for vim-airline
set ttimeoutlen=10  "ms for a key code or mapped sequence to complete
set visualbell      "Use a visual bell instead of beeping

"Mappings
" Use <C-K> to clear the highlighting of :set hlsearch.
map <silent> <C-K> :nohlsearch<CR>

"open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
"switch to left / right window
map <C-h> <C-W>h
map <C-l> <C-W>l
"move between buffers
map <C-Left> :bprev<CR>
map <C-Right> :bnext<CR>
"------------------

"vim-airline settings
"Disable bold accent in vim-airline
call airline#parts#define_accent('mode', 'none')  	    "vi mode text
call airline#parts#define_accent('maxlinenr', 'none')	"trigram
call airline#parts#define_accent('linenr', 'none')  	"ln

let g:airline#extensions#branch#enabled = 1     "enable fugitive integration
let g:airline#extensions#tabline#enabled = 1    "displays all buffers when only one tab open
let g:airline_section_x = ''                    "remove filetype
let g:airline_section_y = ''                    "remove file encoding[fileformat]

"vim-gutter configuration
set updatetime=100      "delay when diff markers appear

"nerdtree settings
let NERDTreeShowHidden=1        "show dot files

"To close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"ctrlp settings
let g:ctrlp_show_hidden = 1     "show dot files

" Color theme
syntax enable           "Enable syntax highlighting for color themes
set background=dark     "dark/light theme
colorscheme solarized8  "vim colorscheme
