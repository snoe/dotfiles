call plug#begin('~/.vim/bundle')
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'

Plug 'snoe/vim-sexp'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'

Plug 'ntpeters/vim-airline-colornum'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'

" All of your Plugs must be added before the following line
call plug#end()

set nocompatible
set number
set splitbelow
set splitright

set mouse=a
set clipboard=unnamed
set background=dark
colorscheme palenight

set cursorline cursorcolumn
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" allow unsaved buffers
set hidden
set backspace=2
set gfn=Monaco:h16
set visualbell t_vb=
set signcolumn=yes
set laststatus=2
set updatetime=300
if (has("termguicolors"))
  set termguicolors
endif

" better command line completion
set wildmode=longest,list,full
set wildmenu
set completeopt=longest,menuone

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
autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2

" save on blur
au FocusLost * silent! wa

syntax on

" So it matches D and C
map Y y$
map <F1> <nop>
imap <F1> <nop>

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#current_first = 0
let g:airline#extensions#tabline#show_splits = 1

let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts = 1
let g:multi_cursor_exit_from_insert_mode=0
nmap [b <Plug>AirlineSelectPrevTab
nmap ]b <Plug>AirlineSelectNextTab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let mapleader = " "

" RainbowParen config
let g:rbpt_colorpairs = [
      \ [118, 118],
      \ ['yellow', 'yellow'],
      \ ['cyan', 'cyan'],
      \ ['red', 'firebrick1'],
      \ ]

au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:markdown_fenced_languages = ['css', 'js=javascript', 'clojure']


set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp/

set statusline+=%#warningmsg#
set statusline+=%*

" sudo to write file
cmap w!! %!sudo tee > /dev/null %

" omni complete
inoremap <Nul> <C-x><C-o>

" clear search
nnoremap <silent> <C-L> :nohls<CR><C-L>

" whitespace
autocmd FileType markdown,sql,c,cpp,python,ruby,javascript,html,java,coffee,less,scss,css,clojure,yaml,make autocmd BufWritePre <buffer> :exe '%s/\s\+$//e'

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.json.template set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript

nnoremap <silent> <C-P> :GFiles --cached --exclude-standard --others<CR>

" Clojure
let g:sexp_enable_insert_mode_mappings = 1

let g:clojure_fuzzy_indent_patterns = ['^doto', '^with', '^def', '^let', 'go-loop', 'match', '^context', '^GET', '^PUT', '^POST', '^PATCH', '^DELETE', '^ANY', 'this-as', '^are', '^dofor']
let g:clojure_align_multiline_strings = 1
let g:clojure_maxlines = 100
let g:clj_refactor_prefix_rewriting=0

" CLOJURE BINDINGS
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

" COC
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>u <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [l <Plug>(coc-diagnostic-prev)
nmap <silent> ]l <Plug>(coc-diagnostic-next)
nmap <silent> [k :CocPrev<cr>
nmap <silent> ]k :CocNext<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

" Highlight symbol under cursor on CursorHold      
autocmd CursorHold * silent call CocActionAsync('highlight')
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>

highlight Normal guibg=#101010 guifg=white
highlight CursorColumn guibg=#202020
highlight CursorLine guibg=#202020

