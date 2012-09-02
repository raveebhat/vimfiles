" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" =============== Vundle Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use vundle plugin to manage all other plugins

filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle ( required! ) 
Bundle 'gmarik/vundle'

"Autocompletion bundles
Bundle 'kana/vim-smartinput'
Bundle 'ervandew/supertab'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

"file/directory movement bundles
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'majutsushi/tagbar'
"requires exuberant-ctags

"handy editing bundles
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tcomment_vim'
Bundle 'YankRing.vim'

"Language support bundles
Bundle 'tpope/vim-markdown'

"misc bundles
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'myusuf3/numbers.vim'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

" ================ General Config ====================

set number                      "Line numbers are good
set showcmd                     "show partially written commands (in the bottom-right corner)
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set gcr=a:blinkon0              "Disable cursor blink, does not work in terminal
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline                  "highlight the current line always
set ruler                       "get a handy ruler in the corner
set encoding=utf-8              "Necessary to show unicode glyphs for powerline
set fileformats=unix,mac,dos    "get all the file formats, set to particular one using :set fileformat= command
set showmatch                   "show matching bracket always
set mouse=a                     "set mouse mode to all, can use the mouse a little bit now
set laststatus=2                "always show the status line, required with powerline
set nofoldenable                "Say no to code folding...
set cpoptions+=$                "show $ at the end of the selection when using c,has to be here otherwise it gets reset
set listchars=tab:▸\ ,eol:¬     "set characters to represent tabs and \n when visible
set scrolloff=3                 "add some context while scroling
set spelllang=en_gb             "set spell to use british english
syntax on

"use the system clipboard by default
"http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed

" ================ remapped keys =====================

" remap leader key, yes i remap to space
let mapleader = " "

" mapping esc to an easy to reach combo
inoremap jk <ESC>

" toggle numbers using numbers.vim's function
nnoremap <F3> :NumbersToggle<CR>

" open gundo window
nnoremap <F5> :GundoToggle<CR>

" shows invisibles in normal mode
nmap <leader>l :set list!<CR>

" open NERDTree window
nnoremap <F4> :NERDTreeTabsToggle<CR>

" open tagbar window
nmap <F8> :TagbarToggle<CR>

"logical movement
noremap j gj
noremap k gk

" toggle spell check
nmap <leader>s :set spell!<CR>

" Use :w!! to save with sudo if you're editing a readonly file,  untested
cmap w!! w !sudo tee % >/dev/null

"never press shift to enter commands again
nmap ; :

"<C-s> will save quickly
imap <C-s> <C-o>:w<CR>


" ================ Persistent swp/backup ==================
" Keep swaps and backups in one place.
" Only works all the time.

silent !mkdir ~/.vim/tmp > /dev/null 2>&1
silent !mkdir ~/.vim/swp > /dev/null 2>&1
set backupdir=~/.vim/tmp
set directory=~/.vim/swp


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points


" ================ Completion =======================

set wildmenu
set wildmode=longest,full
set wildignore=*.o,*.obj,*~,*.png,*.jpg,*.gif "stuff to ignore when tab completing


" ================ Appearance =======================

if &term =~ "xterm-256color" || has("gui_running")
  "get solarized colorscheme
  set background=dark
  " let g:solarized_termcolors=256
  colorscheme solarized
else "if you can't, use this scheme
  colorscheme molokai
endif

if has("gui_running")
  set gfn=Monaco\ for\ Powerline\ 11
  let g:Powerline_symbols = 'fancy'
else
  let g:Powerline_symbols = 'compatible'
endif

let g:syntastic_error_symbol='✗'
let g:nerdtree_tabs_open_on_gui_startup = 0 "never open nerdtree on startup

"trying to get Go support in tagbar
let g:tagbar_type_go = {
      \ 'ctagstype': 'go',
      \ 'kinds' : [
      \'p:package',
      \'f:function',
      \'v:variables',
      \'t:type',
      \'c:const'
      \]
      \}

"time to dive into vim, arrow keys will never work
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>