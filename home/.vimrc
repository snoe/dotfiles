call plug#begin('~/.vim/bundle')
"" Plug 'aquach/vim-http-client'
Plug 'guns/vim-sexp'
"" Plug 'vim-scripts/paredit.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ntpeters/vim-airline-colornum'
Plug 'guns/vim-clojure-static'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

if has('nvim')
  "Plug 'roxma/nvim-completion-manager'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  "Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'

"Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --manifest-path=cparinfer/Cargo.toml --release'}

" All of your Plugs must be added before the following line
call plug#end()

let g:deoplete#enable_at_startup = 1

set nocompatible
set number
set splitbelow
set splitright

set clipboard=unnamed
set background=dark
colorscheme molokai
set cursorline cursorcolumn
highlight CursorColumn ctermbg=240
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

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
let g:loaded_matchparen=1

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
map <F1> <nop>
imap <F1> <nop>

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
let g:sexp_enable_insert_mode_mappings = 1

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

nmap <S-Right> <Plug>(sexp_capture_next_element)<Plug>(sexp_indent)
nmap <S-Left> <Plug>(sexp_emit_tail_element)<Plug>(sexp_indent)
imap <S-Right> <C-O><Plug>(sexp_capture_next_element)<C-O><Plug>(sexp_indent)
imap <S-Left> <C-O><Plug>(sexp_emit_tail_element)<C-O><Plug>(sexp_indent)

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
      \ 'sexp_raise_element':             '<Leader>''',
      \ 'sexp_emit_head_element':         '<Leader>{',
      \ 'sexp_emit_tail_element':         '<Leader>}',
      \ 'sexp_capture_prev_element':      '<Leader>[',
      \ 'sexp_capture_next_element':      '<Leader>]',
      \ 'sexp_flow_to_next_open_bracket': '<M-f>',
      \ 'sexp_flow_to_prev_open_bracket': '<M-b>',
      \ } 

"au User lsp_setup call lsp#register_server({
"        \ 'name': 'clj',
"        \ 'cmd': {server_info->['bash', '-c', 'cd /Users/case/dev/lsp/ && clj -m aclaimant.lsp']},
"        \ 'whitelist': ['clojure'],
"        \ })
"
"let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('/tmp/vim-lsp.log')
"let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')


set hidden

let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_NCM_LOG_LEVEL="DEBUG"
let $NVIM_NCM_MULTI_THREAD=0

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'clojure': ['bash', '-c', 'cd /Users/case/dev/lsp/ && lein rrun'],
    \ }
"let g:LanguageClient_loggingLevel = 'DEBUG'
"
let g:LanguageClient_rootMarkers = {
    \ 'clojure': ['project.clj', 'build.boot', 'deps.edn'],
    \ 'rust': ['Cargo.toml'],
    \ }

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>u :call LanguageClient_textDocument_references()<CR>:lopen<CR>
nnoremap crcc :call LanguageClient#workspace_executeCommand('cycle-coll', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap crth :call LanguageClient#workspace_executeCommand('thread-first', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap crtt :call LanguageClient#workspace_executeCommand('thread-last', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap crtf :call LanguageClient#workspace_executeCommand('thread-first-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap crtl :call LanguageClient#workspace_executeCommand('thread-last-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap crml :call LanguageClient#workspace_executeCommand('move-to-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>
nnoremap cril :call LanguageClient#workspace_executeCommand('introduce-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>

set completefunc=LanguageClient#complete

