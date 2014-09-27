set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'fholgado/minibufexpl.vim'
Bundle 'guns/vim-clojure-static.git'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-classpath.git'
Bundle 'tpope/vim-fireplace.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-align'
Bundle 'vim-scripts/paredit.vim'

" scripts from http://vim-scripts.org/vim/scripts.html
" Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'gitignore'

filetype plugin indent on     

set nocompatible
set number

" set mouse=a
:noremap <LeftRelease> "+y<LeftRelease>
set t_Co=256
set background=dark
colorscheme molokai
set cursorline

" allow unsaved buffers
set hidden
set backspace=2
set gfn=Monaco:h16
set visualbell t_vb=

" better command line completion
set wildmode=longest,list,full
set wildmenu

" show partial commands
set showcmd

" highlight searchs
set hlsearch
set incsearch
" case insensitive unless caps
set ignorecase
set smartcase

set ruler
set confirm
set notimeout ttimeout ttimeoutlen=200

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent
set autoindent
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

syntax on
map Y y$

" Minibuf config
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" Paredit
let g:paredit_electric_return = 1
let g:paredit_smartjump = 1

" RainbowParen config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['blue',        'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['yellow',      'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['blue',        'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

noremap <C-p> :FuzzyFinderFile **/

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" sudo to write file
cmap w!! %!sudo tee > /dev/null %

" omni complete
inoremap <Nul> <C-x><C-o>

" clear search
nnoremap <silent> <C-L> :nohls<CR><C-L>

" select function
" map t ? function <CR>f{vaBV
autocmd FileType c,cpp,python,ruby,java,coffee,less,scss,css,clojure autocmd BufWritePre <buffer> :%s/\s\+$//e
au BufNewFile,BufRead *.less set filetype=less
