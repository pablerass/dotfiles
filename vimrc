execute pathogen#infect()
filetype plugin indent on

autocmd StdinReadPre * let s:std_in=1
" Open NERDTree at startup
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Mark overlength with a linesize of 120
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%100v.\+/

" F2 to enable/disable NerdTree
nmap <silent> <special> <F2> :NERDTreeToggle<RETURN>

" Common C-c C-v functionality with system buffer
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Persiste undo
set undofile
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undos

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Disable line wrapping
set nowrap
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=4
" Convert tabs to spaces
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=5

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Enable spell in different languages
noremap <leader>CS :setlocal spell spelllang=es_es<CR>
noremap <leader>CE :setlocal spell spelllang=en_us<CR>
noremap <leader>CF :setlocal spell spelllang=fr_fr<CR>
noremap <leader>NC :setlocal nospell<CR>
autocmd BufRead,BufNewFile *.md,*.rst setlocal spell spelllang=en_us

" jedi-vim configuration
let g:jedi#popup_on_dot = 0

" vim-airline configuration
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
set t_Co=256
" Configure buffers
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Buffer configuration
" This allows buffers to be hidden if you've modified a buffer
set hidden
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <C-l> :bnext<CR>
" Move to the previous buffer
nmap <C-h> :bprevious<CR>
" Close the current buffer and move to the previous one, this replicates the
" idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Automatic commands
" Enable file type detection
filetype on
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .md as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
" Auto text wrapping
autocmd BufRead,BufNewFile *.md,*.rst setlocal textwidth=99
" Disable automatic indent
autocmd BufRead,BufNewFile *.yml,*.py,*.html,*.xml,*.css,*.js,*.json setlocal noautoindent nocindent nosmartindent indentexpr=
" Set tab space to 2
autocmd BufRead,BufNewFile *.yml,*.xml,*.css,*.sls,*.tf,*.feature,*.json,*.js setlocal tabstop=2
" Force space instead of tabs
autocmd BufRead,BufNewFile *.sh setlocal expandtab!

" Markdown configuration
let vim_markdown_preview_github=1
