set nocompatible    " Keine Abwärtskompatibilität mit vi
filetype off        " required by vundle
filetype plugin off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle' 

Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'skammer/vim-css-color'
Bundle 'msanders/snipmate.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'kevinw/pyflakes-vim'
Bundle 'nelstrom/vim-blackboard'
Bundle 'hukl/Smyck-Color-Scheme'
Bundle 'vim-scripts/synic.vim'

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim    " seems to break pathogen


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype on
filetype plugin indent on " also required by vundle

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set mouse=a 	    " Enable mouse usage (all modes)
set mousemodel=popup
set tabstop=4       " Anzahl an Leerzeichen bei Einrückung
set softtabstop=4   " 4 Leerzeichen werden als Tab erkannt
set shiftwidth=4    " Anzahl an Leerzeichen bei auto-Einrückung
set textwidth=80
set smarttab    
set expandtab
set autoindent
set nosmartindent   " intelligente Einrückung
"set cindent         " C-Stil für Einrückung
"set foldenable      " Code-Einfaltung
"set foldmethod=marker " Darstellung für Faltungen
set number          " Zeilennummerierung anzeigen
set ruler           " aktuelle Cursorposition anzeigen
set laststatus=2    " immer eine Statusleiste anzeigen
set et              " expandtabs
set encoding=utf-8
set termencoding=utf-8
set splitbelow
set splitright

"--- GUI ---
set guifont=Droid\ Sans\ Mono\ 9 
"set guioptions-=T   " keine Toolbar
"set colorcolumn=80
colorscheme synic
"set columns=88
"set lines=50

" Whitespaces anzeigen als…
set listchars=tab:▸\ ,eol:¬,trail:·,
set nolist

set wrap
set linebreak
set showbreak=""

" Suche
set hlsearch    " alles highlighten, was passt
set incsearch   " inkrementelle Suche
set ignorecase  " egal ob groß oder klein
set smartcase   " Großsuche ist sensitiv
set title       " Zeigt den Titel im Konsolentitel an

" STRG + s speichert 
imap <C-S> <esc>:w<cr>
map <c-s> :w<cr>

" in insert modus mit ctrl+hjkl in himmelsrichtungen bewegen
imap <C-h> <left>
imap <C-l> <right>
imap <C-j> <down>
imap <C-k> <up>

" in insert modus mit ctrl-backspace ganze wörter löschen
imap <C-BS> <C-W>
imap <C-j> <C-X><C-O>
imap <C-space> <C-X><C-O>

" Alles löschen können
set backspace=indent,eol,start

" Statusleiste
"fun! <SID>SetStatusLine()
"        let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
"        let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
"        let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
"        execute "set statusline=" . l:s1 . l:s2 . l:s3
"endfun
"call <SID>SetStatusLine()
"
" git-Branch in Statusleiste anzeigen
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set noerrorbells  " Kein nerviger Ton!
set novisualbell  " kein nerviger Blitz!

" omnicompletion
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pysmell#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set wildmenu

" Einfacheres Navigieren zwischen Zeilen
nmap j gj
vmap j gj
nmap k gk
vmap k gk

" Einfaches Navigieren zwischen Fenstern
map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-l> <C-W><C-L>
map <C-h> <C-W><C-H>

" Tastaturkürzel für diverse Plugins
map ,b :buffers<CR>
map ,r :register<CR>
map ,n :NERDTreeToggle<CR>
map ,t :TlistToggle<CR>
map ,m :marks<CR>
map ,g :GundoToggle<CR>
map ,c :clist<CR>

" Snipmate mag es nicht, wenn in der Auswahl j oder k benutzt wird
sunmap j
sunmap k

" Automatisch alle unbenutzten fugitive-Buffer löschen
autocmd BufReadPost fugitive://* set bufhidden=delete

" Django Snipmate-Extension
autocmd FileType python set ft=python.django 
autocmd FileType html setlocal ft=htmldjango.html ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab


"python << END
"import sys
"sys.path.append("/usr/lib/python2.6/")
"sys.path.append("/usr/local/lib/python2.6/dist-packages/pysmell-0.7.3-py2.6.egg")
"END

" Don't display *.pyc files in Nerdtree
let NERDTreeIgnore=[ '\.pyc$', '\~$' ]
