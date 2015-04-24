set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'MHordecki/vim-subword'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'guns/vim-clojure-highlight'
Bundle 'guns/vim-clojure-static.git'
Bundle 'guns/vim-sexp.git'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/paredit.vim'

" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'gitignore'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on     

set nocompatible
set number
set splitbelow
set splitright

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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s|'
let g:airline#extensions#hunks#enabled = 0
set laststatus=2
let g:ctrlp_root_markers = ['project.clj']

let mapleader = ","

" Paredit
"
let g:paredit_leader = '\'
let g:paredit_electric_return = 1
let g:paredit_smartjump = 1
let g:paredit_matchlines = 2000

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
    \ ['darkcyan',    'SeaGreen2'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

cmap pb Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)

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
autocmd FileType c,cpp,python,ruby,java,coffee,less,scss,css,clojure autocmd BufWritePre <buffer> :exe '%s/\s\+$//e'
au BufNewFile,BufRead *.less set filetype=less

let g:clojure_fuzzy_indent_patterns = ['^dom/.*', '^build'] 
"let g:clojure_align_subforms = 1
let g:clojure_fuzzy_indent_patterns = ['^dom/.*', '^build', '^def', '^.*loop$', '^-'] 
let g:clojure_special_indent_words = 'defprotocol,'

" CLOJURE BINDINGS

nmap <Leader>F <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
nmap <Leader>f <Plug>FireplacePrint<Plug>(sexp_outer_list)``
nmap <Leader>e <Plug>FireplacePrint<Plug>(sexp_inner_element)``
nmap <Leader>E :%Eval<CR>
nmap <Leader>r \I
nmap <Leader>w[ \w[
nmap <Leader>w{ \w{
nmap <Leader>w" \w"
vmap <Leader>w[ \w[
vmap <Leader>w{ \w{
vmap <Leader>w" \w"
    

let g:sexp_mappings = {
    \ 'sexp_indent_top':                '=-',
    \ 'sexp_round_head_wrap_element':   '<Leader>W',
    \ 'sexp_swap_element_backward':     '<Leader>t',
    \ 'sexp_swap_element_forward':      '<Leader>T',
    \ 'sexp_emit_head_element':         '<Leader>{',
    \ 'sexp_emit_tail_element':         '<Leader>}',
    \ 'sexp_capture_prev_element':      '<Leader>[',
    \ 'sexp_capture_next_element':      '<Leader>]',
    \ } 
