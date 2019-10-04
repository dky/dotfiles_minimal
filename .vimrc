set ruler
set nocompatible
set hidden
call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'fatih/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dky/vim-aftercolors'
Plug '907th/vim-auto-save'
Plug 'fatih/vim-go'

call plug#end()

"Disable backups and swap
set noswapfile
set nobackup

set number
set relativenumber
"Tab use 3 spaces
set tabstop=3
set shiftwidth=3
"autocompletion
set wildmode=list:longest
"set autoindent
set smartindent
"split below
set splitbelow
set hlsearch
set incsearch
set foldenable
"enable paste mode for pasted code
set pastetoggle=<F2>
"Allow backspacing in insert mode
set backspace=indent,eol,start
set visualbell           "don't beep
set noerrorbells         "don't beep
"renamp esc to jk
imap jk <Esc>
"comment out blocks of code using nerdcommenter shortcut
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>
"no arrow keys
nmap <left> <nop>
nmap <right> <nop>

nmap <F4> :set number! <bar> :set relativenumber! <bar> :set list! <bar> :GitGutterSignsDisable<CR>
"nerdtree
nmap ,nt :NERDTreeToggle<CR>
nmap <F1> :NERDTreeToggle<CR>
"map f1 vim help to esc
imap <F1> <Esc>

"tagbar toggle
"requires exuberant-ctags, 
"go - github.com/jstemmer/gotags
nmap ,tb :TagbarToggle<CR>
"nmap <F1><F1> :TagbarToggle<CR>
au FileType go nmap <F1><F1> :TagbarToggle<CR>

set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,go.mod,go.sum
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 0
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"Indent code
nmap <F3> gg=G'.
"tabs
nmap ,t <Esc>:tabn<CR>
nmap ,tp <Esc>:tabp<CR>
nmap ,tn <Esc>:tab new<CR>
"Nerdtree bookmark
nmap ,nb :Bookmark
nmap <leader>l :set list!<CR>
"edit .vimrc quickly
nmap ,ev :tabedit $HOME/.vimrc<CR>
nmap ,ch :CheckHealth<CR>
nmap ,up :UpdateRemotePlugins<CR>
"reload vim quickly
nmap ,rv :source $MYVIMRC<CR>
"map space rather than colon
nmap <space> :
"Shortcut for vundle
nmap ,bi :PlugInstall<CR>
nmap ,gib :GoInstallBinaries<CR>
"Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

"nmap <c-o> o
"nmap <c-k> O
"fugitive
nnoremap ,gs :Gstatus<CR>
nnoremap ,gd :Gdiff<CR>
nnoremap <F11> :Gdiff<CR>
nnoremap ,<F11> :Gstatus<CR>
nnoremap <silent> ,gpu :execute ":!git push origin master"<CR><CR>
nnoremap <F9> :execute ":!git push origin master"<CR>
nnoremap ,gma :!git add . && git cm "
nnoremap <F10> :!git add . && git cm "
imap <F10> <Esc> :!git add . && git cm "
nnoremap ,gpd :Git pull origin master<CR>

"https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O
"Jump to next bracket/empty line
"inoremap <C-j> <C-o>}

"surround markdown emphasis
nnoremap ,s* ciw**<C-r>"**<Esc>
nnoremap ,s" ciw"<C-r>""<Esc>
nnoremap ,s` ciw`<C-r>"`<Esc>
nnoremap ,s[ ciw[<C-r>"]<Esc>

"vim-airline
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
"buffer tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"set statusline at the bottom
set laststatus=2
"molokai colorscheme
silent! colorscheme molokai
"use the same symbols as TextMate for tabstops and EOLs
scriptencoding utf-8
set encoding=utf-8
set listchars=eol:¬,tab:▸-,trail:~,extends:>,precedes:<
set list

"fzf
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

if has("noinsert")
	"neocomplete like
	set completeopt+=noinsert
elseif has ("noselect")
	set completeopt+=noselect
endif

set cursorline
"default colors for CursorLine
"https://jonasjacek.github.io/colors
hi CursorLine ctermbg=236
"hi Cursor guibg=#A6E22E;
"change Color when entering Insert Mode
"autocmd InsertEnter * hi CursorLine ctermbg=237
autocmd InsertEnter * hi CursorLine ctermbg=24
"autocmd InsertEnter * hi Cursor guibg=#00AAFF;
"revert Color to default when leaving Insert Mode
autocmd InsertLeave * hi CursorLine ctermbg=236
"autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;" This 
hi LineNr ctermbg=236 ctermfg=246
hi Visual ctermbg=190 ctermfg=16
hi Comment ctermfg=43
"search colors
hi Search cterm=NONE ctermfg=white ctermbg=238

"restore me to the last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

let g:auto_save = 1  " enable AutoSave on Vim startup
