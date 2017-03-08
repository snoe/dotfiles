set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'airblade/vim-gitgutter'
"Plugin 'aquach/vim-http-client'
Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-airline-colornum'
Plugin 'guns/vim-clojure-static.git'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'lambdatoast/elm.vim'
"Plugin 'venantius/vim-cljfmt'
Plugin 'guns/vim-sexp.git'
Plugin 'vim-scripts/paredit.vim'

if has("nvim")
  Plugin 'neovim/node-host'
  Plugin 'hylang/vim-hy'
  "Plugin 'hkupty/acid.nvim'
  Plugin 'clojure-vim/clj-refactor.nvim'
  "Plugin 'clojure-vim/nvim-parinfer.js'
  "Plugin 'file:///Users/case/dev/nvim-parinfer.js'
  "Plugin 'file:///Users/case/dev/clj-refactor.nvim'
  "Plugin 'file:///Users/case/dev/paredit.nvim'
endif

" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'gitignore'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on     

set nocompatible
set number
set splitbelow
set splitright

set clipboard=unnamed
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

" save on blur
au FocusLost * silent! wa

syntax on

" So it matches D and C
map Y y$

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s|'
let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts = 1
set laststatus=2
let g:ctrlp_root_markers = ['project.clj']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

let mapleader = " "

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

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" sudo to write file
cmap w!! %!sudo tee > /dev/null %

" omni complete
inoremap <Nul> <C-x><C-o>

" clear search
nnoremap <silent> <C-L> :nohls<CR><C-L>

" whitespace
autocmd FileType c,cpp,python,ruby,javascript,html,java,coffee,less,scss,css,clojure,yaml,make autocmd BufWritePre <buffer> :exe '%s/\s\+$//e'

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.json.template set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript

" Clojure
let g:paredit_mode = 1
let g:paredit_leader = '\'
let g:paredit_electric_return = 0
let g:paredit_smartjump = 1
let g:paredit_matchlines = 20000
let g:clj_fmt_autosave = 1
"let g:parinfer_mode = "indent"
"nmap <S-Right> <ESC>:let g:parinfer_mode='paren'<CR> ]:let g:parinfer_mode='indent'<CR>

let g:sexp_enable_insert_mode_mappings = 0

let g:clojure_fuzzy_indent_patterns = ['^dom/.*', '^build', '^def', '^.*loop$', '^-', '^this-as', '^with-', '^GET', '^POST', '^PUT', '^DELETE', '^PATCH', '^ANY', '^context', 'register', 'comment', 'try', 'cond', 'do'] 
let g:clojure_special_indent_words = 'defprotocol'
let g:clojure_fuzzy_indent_blacklist = ['->', '->>']
let g:clojure_align_subforms = 1

let g:clj_refactor_prefix_rewriting=0

" Make this work with figwheel
" cmap pb Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)

" CLOJURE BINDINGS
"autocmd FileType clojure autocmd BufWritePre <buffer> :CFormatAll

nmap <Leader>F <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
nmap <Leader>f <Plug>FireplacePrint<Plug>(sexp_outer_list)``
nmap <Leader>e <Plug>FireplacePrint<Plug>(sexp_inner_element)``
nmap <Leader>d [<C-D>
nmap <Leader>E :%Eval<CR>
nmap <Leader>R cqp(require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)<CR>
nmap <Leader>w( ysie)
nmap <Leader>w[ ysie]
nmap <Leader>w{ ysie}
nmap <Leader>w" ysie"
vmap <Leader>w( S)
vmap <Leader>w[ S]
vmap <Leader>w{ S}
vmap <Leader>w" S"

"nmap <S-Right> <Plug>(sexp_capture_next_element):exe "normal gg=G<C-o><C-o>"<CR>
"nmap <S-Left> <Plug>(sexp_emit_tail_element):exe "normal gg=G<C-o><C-o>"<CR>
"imap <S-Right> <C-O><Plug>(sexp_capture_next_element)<C-O>:exe "normal gg=G<C-o><C-o>"<CR>
"imap <S-Left> <C-O><Plug>(sexp_emit_tail_element)<C-O>:exe "normal gg=G<C-o><C-o>"<CR>

nmap <S-Right> <Plug>(sexp_capture_next_element)<Plug>(sexp_indent_top)
nmap <S-Left> <Plug>(sexp_emit_tail_element)<Plug>(sexp_indent_top)
imap <S-Right> <C-O><Plug>(sexp_capture_next_element)<Plug>(sexp_indent_top)
imap <S-Left> <C-O><Plug>(sexp_emit_tail_element)<Plug>(sexp_indent_top)

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
      \ 'sexp_swap_element_backward':     '<Leader>T',
      \ 'sexp_swap_element_forward':      '<Leader>t',
      \ 'sexp_raise_element':             '<Leader>r',
      \ 'sexp_emit_head_element':         '<Leader>{',
      \ 'sexp_emit_tail_element':         '<Leader>}',
      \ 'sexp_capture_prev_element':      '<Leader>[',
      \ 'sexp_capture_next_element':      '<Leader>]',
      \ } 

if !has("nvim")
  echo "VIM"
endif

