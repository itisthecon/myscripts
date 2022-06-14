" Paste mode toggle, it seems that Nvim's bracketed paste mode
" does not work very well for nvim-qt, so we use good-old paste mode
set pastetoggle=<F12>

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=500

set updatetime=500  " For CursorHold events

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

set number relativenumber  " Show line number and relative line number

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" List all matches and complete till longest common string
set wildmode=list:longest

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3
" Disable showing current mode on command line since statusline plugins can show it.
set noshowmode

set fileformats=unix,dos  " Fileformats to use for new files

" Ask for confirmation when handling unsaved or read-only files
set confirm

set visualbell noerrorbells  " Do not use visual and errorbells
set history=5000  " The number of command and search history to keep

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣

" Show hostname, full path of file and last-mod time on the window title. The
" meaning of the format str for strftime can be found in
" http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
" lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
set title
set titlestring=
set titlestring=%{Get_titlestr()}

" Persistent undo even after you close a file and re-open it
set undofile

" hightlight column and line
" 高亮光标所在的行
set cursorline

"搜索高亮颜色
hi Search ctermbg=LightYellow
hi Search ctermfg=DarkRed

set mouse=

" Enable true color support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
set termguicolors

" 设置高亮配对字符
" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

" 显示行号和相对行号
set number! relativenumber!

" ensure vim runtime dirctory exist
call EnsureDirExists($HOME . '/.nvim/backup')
call EnsureDirExists($HOME . '/.nvim/swap')
call EnsureDirExists($HOME . '/.nvim/undo')

" set dirs
set undodir=~/.nvim/undo
set backupdir=~/.nvim/backup
set directory=~/.nvim/swap


" Custom mapping <leader> (see `:h mapleader` for more info)
let g:mapleader = ','
