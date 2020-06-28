" -----------------------------------CONTENTS----------------------------------
" 1. Plugins    2. Settings    3. Mappings    4. Plugin Specific   5. Functions

" ------------------------------------PLUGINS----------------------------------
call plug#begin('~/.vim/plugged')

" -- FUNCTIONAL
Plug 'airblade/vim-gitgutter'             " Show git diff in gutter
Plug 'tpope/vim-fugitive'                 " Git wrapper
Plug 'scrooloose/nerdtree'                " File tree
Plug 'vim-scripts/taglist.vim'            " Methods/variables list
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }   " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'                " Have file system follow you around
Plug 'eugen0329/vim-esearch'
Plug 'sjl/gundo.vim'                      " Undo tree
Plug 'ycm-core/YouCompleteMe'             " Code completion
Plug 'preservim/nerdcommenter'            " Comment stuff out
Plug 'vimwiki/vimwiki'
" -- SYNTAX + READIBILITY
Plug 'sheerun/vim-polyglot'               " Better Syntax support
Plug 'jiangmiao/auto-pairs'               " Auto pairs for '(' '[' '{' 
Plug 'alvan/vim-closetag'                 " Auto close HTML tags
Plug 'frazrepo/vim-rainbow'               " Color match pairs
" -- COSMETIC
Plug 'vim-airline/vim-airline'            " Status bar + tabs
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'                   " Preview css colors
Plug 'sainnhe/gruvbox-material'
Plug 'christianchiarulli/onedark.vim'     

call plug#end()


" ----------------------------------SETTINGS----------------------------------
" -- GENERAL
set nocompatible              " Enable features that aren't compatible with Vi
filetype plugin indent on            " Enable file specific features
set autoread                  " Reload file when changed externally
set nobackup                  " Don't need .bkp when version control exists
set nowritebackup
set noswapfile                " Pls no .swp

set undodir=~/.vim_undo       " MAKE THIS DIR WHEN ON NEW MACHINE!!
set undofile                  " Persistent undos
set undolevels=1000           
set clipboard=unnamedplus     " Copy paste between vim and everything else
set autochdir                 " Current directory = working directory

" -- FORMATTING
set expandtab                 " Expand tab chars to space chars
set smarttab
set shiftround                " Use multiple of shiftwidth when indenting
set shiftwidth=4              " One tab = 4 spaces
set tabstop=4       
set softtabstop=4             " Enables easy removal of indentation level
set autoindent                " Copy prev level's indent
set smartindent               " Makes indenting smart
set backspace=2               " Make backspace work like normal
set wrap

set shortmess+=c              " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      
set updatetime=300            " Faster completion
set timeoutlen=100            " By default timeoutlen is 1000 ms
set termguicolors
if $TERM == "xterm-256color"
    set t_Co=256
endif

set mmp=1300

" -- SEARCHING
set ignorecase                " Search is not case sensitive
set smartcase                 " Overrides some ignorecase properties, like all caps
set incsearch                 " Show search matches as you type

" -- INTERFACE
set encoding=utf-8
set fileencoding=utf-8                  
set hidden                    " Abandon buffer when closed
set foldmethod=indent         " Fold at current indent line
set foldopen+=jump            " Open folds when at direct jump to location
set nofoldenable
set mouse=a                   " Enable mouse
set splitbelow                " Horizontal splits will automatically be below
set splitright                " Vertical splits will automatically be to right
set showtabline=2             " Always show tabs 

" Always show line numbers, but only in current window.
set number
au WinEnter * setlocal number
au WinLeave * setlocal nonumber
" Automatically resize vertical splits.
au WinEnter * set winfixheight
au WinEnter * wincmd =

set pumheight=10              " Makes popup menu smaller
set cmdheight=2               " More space for displaying messages
set conceallevel=0            " So that I can see `` in markdown files

syntax on
set t_Co=256                  " Support 256 colors
set termguicolors
set laststatus=2              " Always display the status line
set noshowmode                " Don't show standard mode i.e. -- INSERT --
set colorcolumn=80            " Show 80 character mark
set background=dark                     
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material


" -----------------------------------MAPPINGS---------------------------------
cmap w!! w !sudo tee %

let mapleader=" "
" Indent
vnoremap < <gv
" Fold
vnoremap <leader>f zf 
" Alternative Esc
inoremap jk <Esc> 
inoremap kj <Esc>
" Window navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Tabs/Windows
nnoremap J gT
nnoremap K gt
nnoremap T :tabnew<Space>
nnoremap <C-Left> :tabm -1<CR>
nnoremap <C-Right> :tabm +1<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" Terminal 
map <C-t> :term<CR>
tnoremap <Esc> <C-w>N<CR>
" FZF
nnoremap <C-p> :GFiles<CR>
" Ag
nnoremap <C-o> :Ag<CR>


" ---------------------------PLUGIN SPECIFC SETTINGS---------------------------
" -- ONE DARK
hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" -- AIRLINE
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'           " Show just file name

let g:airline_powerline_fonts = 1                          
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail' " File ending
let g:airline_section_y = ''
let g:airline_mode_map = {
            \ '__'     : '-',
            \ 'c'      : 'C',
            \ 'i'      : 'I',
            \ 'ic'     : 'I',
            \ 'ix'     : 'I',
            \ 'n'      : 'N',
            \ 'multi'  : 'M',
            \ 'ni'     : 'N',
            \ 'no'     : 'N',
            \ 'R'      : 'R',
            \ 'Rv'     : 'R',
            \ 's'      : 'S',
            \ 'S'      : 'S',
            \ 't'      : 'T',
            \ 'v'      : 'V',
            \ 'V'      : 'V',
            \ ''       : 'V',
            \ }

" -- NERD-TREE
set modifiable
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
nmap <C-n> :NERDTreeToggle<CR>
" Open when no files were speficied on vim launch
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" -- NERD-COMMENTER
vmap ++ :NERDCommenterToggle
nmap ++ :NERDCommenterToggle<CR>

" -- RAINBOW
let g:rainbow_active = 1
let g:rainbow_load_separately = [
            \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
            \ [ '*.tex' , [['(', ')'], ['\[', '\]']]  ],
            \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
            \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>','</[^>]*>']]  ],
            \]

" -- CLOSETAGS
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'

" -- GITGUTTER
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = 'x'
let g:gitgutter_sign_removed_first_line = 'x'
let g:gitgutter_sign_modified_removed   = 'x'
let g:gitgutter_enabled = 1
highlight GitGutterAdd    guifg=#98c379 ctermfg=2
highlight GitGutterChange guifg=#61afef ctermfg=3
highlight GitGutterDelete guifg=#e06c75 ctermfg=1

" -- MARKDOWN-PREVIEW
let g:mkdp_auto_close = 0
"let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/nick/.local/lib/github-markdown-css/github-markdown.css'

" -- FUGATIVE
nmap <leader>gs :G<CR>
nmap <leader>gf :difget //2<CR>
nmap <leader>gj :difget //3<CR>

" -- INDENT
let g:indentLine_enabled = 1

" -- CODI
highlight CodiVirtualText guifg=red
let g:codi#virtual_text_prefix = "❯ "
let g:codi#aliases = {
            \ 'javascript.jsx': 'javascript',
            \ }

" -- TAGLIST
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
map <C-b> :TlistToggle<CR>

" Cursor based on mode
let &t_SI.="\e[5 q"           " SI = INSERT mode
let &t_SR.="\e[4 q"           " SR = REPLACE mode
let &t_EI.="\e[2 q"           " EI = NORMAL mode (ELSE)



" ---------------------------------FUNCTIONS----------------------------------
" Turn spellcheck on for markdown files
augroup auto_spellcheck
    autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" Set working directory to curr file directory
autocmd BufEnter * lcd %:p:h

" Set diff colorcolumn for Java
autocmd bufreadpre *.java setlocal colorcolumn=120

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" -----------------------------------NOTES------------------------------------
" On load to new machine
" - Check at least Vim v8
" - Setup YouCompleteMe
" - Install ctags; powerfonts
" - Make dir for swap files - mkdir ~/.vimswap
" - Ag install - sudo apt-get install silversearcher-ag
