" -----------------------------------PLUGINS----------------------------------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy finder
Plug 'airblade/vim-rooter'                " Have file system follow you around
Plug 'scrooloose/nerdtree'                
Plug 'preservim/nerdcommenter' 
Plug 'tpope/vim-sleuth'                   " Auto indent settings
Plug 'norcalli/nvim-colorizer.lua'        " CSS colors
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'               " Auto pairs for '(' '[' '{' 
Plug 'alvan/vim-closetag'                 " Closetags
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ycm-core/YouCompleteMe'             " Code completion
Plug 'ChristianChiarulli/codi.vim'        " Interactive code
Plug 'vimwiki/vimwiki'
Plug 'majutsushi/tagbar'                  " Method/variable view
" Plug 'liuchengxu/vista.vim'
Plug 'christianchiarulli/onedark.vim' 
Plug 'morhetz/gruvbox'

call plug#end()


" -----------------------------------MAPPINGS---------------------------------
let mapleader=" "
" Indent
vnoremap < <gv
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


" ----------------------------------SETTINGS----------------------------------
set iskeyword+=-              " Treat dash separated words as a word text object"
set formatoptions-=cro        " Stop newline continution of comments

syntax on                           
set background=dark                     

set colorcolumn=80

set hidden                    " Required to keep multiple buffers open 
set wrap linebreak                              
set encoding=utf-8                      
set fileencoding=utf-8                  
set pumheight=10              " Makes popup menu smaller
set ruler              	      " Show the cursor position all the time
set cmdheight=2               " More space for displaying messages
set mouse=a                   " Enable your mouse
set splitbelow                " Horizontal splits will automatically be below
set splitright                " Vertical splits will automatically be to right
set t_Co=256                  " Support 256 colors
set conceallevel=0            " So that I can see `` in markdown files

set tabstop=4                           
set shiftwidth=4                        
set smarttab                            
set expandtab                 " Converts tabs to spaces
set smartindent               " Makes indenting smart
set autoindent                " Good auto indent
set noshowmode
set laststatus=2              " Always display the status line
set number                             
set showtabline=2             " Always show tabs 
set nobackup                  " This is recommended by coc
set nowritebackup             " This is recommended by coc
set shortmess+=c              " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      
set updatetime=300            " Faster completion
set timeoutlen=100            " By default timeoutlen is 1000 ms
set clipboard=unnamedplus     " Copy paste between vim and everything else
set incsearch

set mmp=1300
set autochdir                 " Working directory = working directory
" set foldcolumn=3            " Folding abilities
set nocompatible
filetype plugin on

set guifont=JetBrains\ Mono

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Cursor based on mode
let &t_SI.="\e[5 q"           " SI = INSERT mode
let &t_SR.="\e[4 q"           " SR = REPLACE mode
let &t_EI.="\e[2 q"           " EI = NORMAL mode (ELSE)

" You can't stop me
cmap w!! w !sudo tee %

let g:python_highlight_all=1  " Experimental


" ---------------------------PLUGIN/THEME SETTINGS----------------------------
" -- ONE DARK
hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" -- AIRLINE
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'           " Show just file name
let g:airline_powerline_fonts = 1                          
let g:airline#extensions#tabline#formatter = 'unique_tail' " File ending
let g:airline_section_y = ''
let g:airline#extensions#wordcount#format = '%d w'
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
      \ ''     : 'V',
      \ }

" -- NERD-TREE
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
nmap <C-n> :NERDTreeToggle<CR>
" Open when no files were speficied on vim launch
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" -- NERD-COMMENTER
vmap ++ :NERDCommenterToggle
nmap ++ :NERDCommenterToggle<CR>

" -- RAINBOW
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses

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

" -- INDENT
let g:indentLine_enabled = 1

" -- GRUVBOX
let g:gruvbox_contrast_dark = 'hard'
let g:gitgutter_override_sign_column_highlight=1
colorscheme gruvbox

" -- CODI
highlight CodiVirtualText guifg=red
let g:codi#virtual_text_prefix = "❯ "
let g:codi#aliases = {
                   \ 'javascript.jsx': 'javascript',
                   \ }

" -- INDENTLINE
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = "·"

" -- TAGBAR
map <C-b> :TagbarToggle<CR>

" -- CTRL-P
let g:ctrlp_working_path_mode = 'ra'        " Use curr repo/dir with ctrl p 

" ---------------------------------FUNCTIONS----------------------------------
" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END


" -----------------------------------NOTES------------------------------------
" On load to new machine
" - Check at least Vim v8
" - Setup YouCompleteMe
