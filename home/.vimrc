" let $NVIM_COC_LOG_LEVEL='trace'

call plug#begin('~/.vim/bundle')
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'

Plug 'plasticboy/vim-markdown'

Plug 'snoe/vim-sexp'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim'

Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'

" All of your Plugs must be added before the following line
call plug#end()

set nocompatible
set number
set splitbelow
set splitright

let mapleader = " "
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
set redrawtime=5000
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

let g:multi_cursor_exit_from_insert_mode=0

let g:airline#extensions#branch#enabled = 1

let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:false
let bufferline.icons = 'both'
"
" close buffers like browser tabs
command Bd BufferCloseBuffersRight
nmap <leader>q :BufferWipeout<CR>
nmap [b :BufferPrevious<CR>
nmap ]b :BufferNext<CR>
nmap <leader>1 :BufferGoto 1<CR>
nmap <leader>2 :BufferGoto 2<CR>
nmap <leader>3 :BufferGoto 3<CR>
nmap <leader>4 :BufferGoto 4<CR>
nmap <leader>5 :BufferGoto 5<CR>
nmap <leader>6 :BufferGoto 6<CR>
nmap <leader>7 :BufferGoto 7<CR>
nmap <leader>8 :BufferGoto 8<CR>
nmap <leader>9 :BufferGoto 9<CR>

" RainbowParen config
let g:rbpt_colorpairs = [
      \ ['201', '#FF00FF'],
      \ ['yellow', 'yellow'],
      \ ['cyan', 'cyan'],
      \ ['red', 'firebrick1'],
      \ ]

au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:markdown_fenced_languages = ['css', 'js=javascript', 'clojure']
let g:vim_markdown_folding_disabled = 1

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
au BufNewFile,BufRead *.bb set filetype=clojure

nnoremap <silent> <C-P> :GFiles<CR>

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
      \ 'sexp_swap_element_backward':     '<Leader>C',
      \ 'sexp_swap_element_forward':      '<Leader>c',
      \ 'sexp_raise_element':             '<Leader>''',
      \ 'sexp_emit_head_element':         '<Leader>{',
      \ 'sexp_emit_tail_element':         '<Leader>}',
      \ 'sexp_capture_prev_element':      '<Leader>[',
      \ 'sexp_capture_next_element':      '<Leader>]',
      \ 'sexp_flow_to_next_open_bracket': '<M-f>',
      \ 'sexp_flow_to_prev_open_bracket': '<M-b>',
      \ } 


"call lsp#add_filetype_config({
"          \ 'filetype': 'clojure',
"          \ 'name': 'clojure-lsp',
"          \ 'cmd': ['bash', '-c', 'cd /Users/case/dev/lsp/ && lein run'],
"          \ })

" COC
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>u <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')

"let g:coc_enable_locationlist = 0
"autocmd User CocLocationsChange CocList --normal location

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
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcp :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-privacy', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cris :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'inline-symbol', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>
nnoremap <silent> crci :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cursor-info', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crsi :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'server-info', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> <leader>T :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-coll-entry-up', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> <leader>t :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-coll-entry-down', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crmf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-form', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input("File: ", "", "file")]})<CR>
nnoremap <silent> crfe :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'create-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>

" Copies the log-path to your clipboard
nnoremap <silent> crsl :call setreg('*', CocRequest('clojure-lsp', 'clojure/serverInfo/raw')['log-path'])<CR>
" Connects to nrepl
nnoremap <silent> crsp :execute 'Connect' CocRequest('clojure-lsp', 'clojure/serverInfo/raw')['port']<CR>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Fix autofix problem of current line
nmap <leader>aq  <Plug>(coc-fix-current)
" workspace symbols 
nnoremap <silent><leader>s  :<C-u>CocList -I symbols<cr>

function! s:LoadClojureContent(uri)
  setfiletype clojure
  let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
  call setline(1, split(content, "\n"))
  setl nomodified
  setl readonly
endfunction
autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))

highlight Normal guibg=#101010 guifg=white
highlight CursorColumn guibg=#202020
highlight Keyword guifg=#FFAB52
highlight CursorLine guibg=#202020
hi clear CocHighlightText
hi CocHighlightText guibg=#472004
hi CocFadeOut gui=undercurl cterm=undercurl

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
