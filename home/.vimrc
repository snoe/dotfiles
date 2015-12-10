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
Bundle 'airblade/vim-gitgutter'
"Bundle 'aquach/vim-http-client'
Bundle 'bling/vim-airline'
Bundle 'ntpeters/vim-airline-colornum'
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
Bundle 'lambdatoast/elm.vim'
Bundle 'venantius/vim-cljfmt'
Bundle 'neovim/node-host'
"Bundle 'vim-scripts/paredit.vim'
Bundle 'snoe/nvim-parinfer.js'

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
set cursorline cursorcolumn
highlight CursorColumn ctermbg=233

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

" disable sticky esc key 
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FocusLost * silent! wa

syntax on
map Y y$

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s|'
let g:airline#extensions#hunks#enabled = 0
set laststatus=2
let g:ctrlp_root_markers = ['project.clj']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

let mapleader = " "

" Paredit
"
let g:paredit_leader = '\'
let g:paredit_electric_return = 1
let g:paredit_smartjump = 1
let g:paredit_matchlines = 2000
let g:clj_fmt_autosave = 1

" Hopefully parinfer covers this
let g:sexp_enable_insert_mode_mappings = 0
let g:paredit_mode = 0
let g:paredit_electric_return = 0

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

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" sudo to write file
cmap w!! %!sudo tee > /dev/null %

" omni complete
inoremap <Nul> <C-x><C-o>

" clear search
nnoremap <silent> <C-L> :nohls<CR><C-L>

" tab keeps visual mode - sorta works
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" whitespace
autocmd FileType c,cpp,python,ruby,java,coffee,less,scss,css,clojure,yaml,make autocmd BufWritePre <buffer> :exe '%s/\s\+$//e'

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.json.template set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript


"let g:clojure_align_subforms = 1
let g:clojure_fuzzy_indent_patterns = ['^dom/.*', '^build', '^def', '^.*loop$', '^-', '^this-as', '^with-', '^GET', '^POST', '^PUT', '^DELETE', '^PATCH', '^ANY', '^context', 'register'] 
let g:clojure_special_indent_words = 'defprotocol,'
let g:clojure_fuzzy_indent_blacklist = ['->', '->>', 'as->']
let g:clojure_align_subforms = 1

" CLOJURE BINDINGS

nmap <Leader>F <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
nmap <Leader>f <Plug>FireplacePrint<Plug>(sexp_outer_list)``
nmap <Leader>e <Plug>FireplacePrint<Plug>(sexp_inner_element)``
nmap <Leader>d [<C-D>
nmap <Leader>E :%Eval<CR>
nmap <Leader>R cqp(require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)<CR>
nmap <Leader>w( ysae)
nmap <Leader>w[ ysae]
nmap <Leader>w{ ysae}
nmap <Leader>w" ysaW"
vmap <Leader>w( S)
vmap <Leader>w[ S]
vmap <Leader>w{ S}
vmap <Leader>w" S"

let g:sexp_mappings = {
    \ 'sexp_outer_list':                'af',
    \ 'sexp_inner_list':                'if',
    \ 'sexp_outer_top_list':            'aF',
    \ 'sexp_inner_top_list':            'iF',
    \ 'sexp_outer_string':              'as',
    \ 'sexp_inner_string':              'is',
    \ 'sexp_outer_element':             'ae',
    \ 'sexp_inner_element':             'ie',
    \ 'sexp_move_to_prev_bracket':      '(',
    \ 'sexp_move_to_next_bracket':      ')',
    \ 'sexp_indent_top':                '=-',
    \ 'sexp_round_head_wrap_element':   '<Leader>W',
    \ 'sexp_swap_element_backward':     '<Leader>t',
    \ 'sexp_swap_element_forward':      '<Leader>T',
    \ 'sexp_raise_element':             '<Leader>r',
    \ 'sexp_emit_head_element':         '<Leader>{',
    \ 'sexp_emit_tail_element':         '<Leader>}',
    \ 'sexp_capture_prev_element':      '<Leader>[',
    \ 'sexp_capture_next_element':      '<Leader>]',
    \ } 

