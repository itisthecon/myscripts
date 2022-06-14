" ln -s /usr/local/share/vim/vimrc /usr/local/share/nvim/sysinit.vim
" ln -s /usr/local/share/vim/vim82/vimrc_example.vim /usr/local/share/nvim/runtime/
" ln -s /usr/local/share/vim/vim82/defaults.vim /usr/local/share/nvim/runtime/
"
" mkdir -p ~/.local/share/nvim/site/autoload
" wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O
" ~/.local/share/nvim/site/autoload/plug.vim

" ln -s /usr/local/share/vim/vimrc /usr/local/share/nvim/sysinit.vim
" ln -s /usr/local/share/vim/vim82/vimrc_example.vim /usr/local/share/nvim/runtime/
" ln -s /usr/local/share/vim/vim82/defaults.vim /usr/local/share/nvim/runtime/
"
" pip install pynvim
" npm install -g yarn
" cd ~/.vim/plugged/coc.nvim/
" yarn install
" yarn build


" functions ----------------------- {{{

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

" 状态条git分支显示
function Gitbr()
    let branchname = gitbranch#name()
    if strlen(branchname) < 1
        return ""
    endif
    return ' ' . branchname
endfunction

"确保备份交换和undo目录存在
function! EnsureDirExists (dir)
   if !isdirectory(a:dir)
     if exists("*mkdir")
       call mkdir(a:dir,'p')
       echo "Created directory: " . a:dir
     else
       echo "Please create directory: " . a:dir
     endif
   endif
endfunction

function! Get_titlestr() abort
  let l:title_str = ''
  if g:is_linux
      let l:title_str = hostname() . '  '
  endif
  let l:title_str = l:title_str . expand('%:p:~') . '  '
  if &buflisted
    let l:title_str = l:title_str . strftime('%Y-%m-%d %H:%M',getftime(expand('%')))
  endif

  return l:title_str
endfunction

function! Add_pack(name) abort
  let l:status = v:true

  return l:status
endfunction

" Generate random integers in the range [Low, High] in pure vim script,
" adapted from https://stackoverflow.com/a/12739441/6064933
function! RandInt(Low, High) abort
  " Use lua to generate random int. It is faster. Ref: https://stackoverflow.com/a/20157671/6064933
  call v:lua.math.randomseed(localtime())
  return v:lua.math.random(a:Low, a:High)
endfunction

" Selection a random element from a sequence/list
function! RandElement(seq) abort
  let l:idx = RandInt(0, len(a:seq)-1)

  return a:seq[l:idx]
endfunction

" }}}

" init setting ----------------------- {{{

let s:core_conf_files = [
      \ 'autocommands.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false

" }}}

" settings config ----------------------- {{{

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

" }}}

" Vimrc file plugins ----------------------- {{{

call plug#begin('~/.config/nvim/plugged')

" Speed up loading Lua modules in Neovim to improve startup time.
Plug 'lewis6991/impatient.nvim'

" Rainbow Parentheses Improved
Plug 'luochen1990/rainbow'

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" A (Neo)vim plugin for formatting code. :Neoformat
Plug 'sbdchd/neoformat'


" Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
" It expands on the idea of simple commands like di'
Plug 'wellle/targets.vim'

" sandwich.vim is a set of operator and textobject plugins to
" add/delete/replace surroundings of a sandwiched textobject, like (foo), 'bar'.
" Press sa{motion/textobject}{addition}. For example, a key sequence saiw( makes foo to (foo).
" Press sdb or sd{deletion}. For example, key sequences sdb or sd( makes (foo) to foo.
Plug 'machakann/vim-sandwich'

" themes..
Plug 'sainnhe/sonokai'
Plug 'lifepillar/vim-gruvbox8'
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'shaunsingh/nord.nvim'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'sainnhe/everforest'
Plug 'EdenEast/nightfox.nvim'
Plug 'rebelot/kanagawa.nvim'

"状态栏相关设置
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'ryanoasis/vim-devicons'

" 根据符号多行对齐
" 使用方法:
" 按 => 对齐为例
" :Tabularize /=>
Plug 'godlygeek/tabular' " 文本对齐 :help tabular

Plug 'tpope/vim-commentary' " 用gcc来注释一行（需要计数）

" 用来加括号，引号，前后缀等等，写XML很有用（特别是配合repeat）
" cs"'               双引号转单引号
" cs'<q>             单引号转<q></q>
" cst"               再转回来
" ds"                删掉双引号
" ys<text-obj>"      添加符号,比如ysid" -- 给当前句子加上引号
Plug 'tpope/vim-surround' " 快速改变surroud符号，比如 cs(' 把()改成''

"兼容源代码目录中的.editorcontig配置
Plug 'editorconfig/editorconfig-vim'

"自动补全引号括号等
Plug 'Raimondi/delimitMate'

"fish syntax扩展
Plug 'dag/vim-fish'

Plug 'ntpeters/vim-better-whitespace'

Plug 'lukas-reineke/indent-blankline.nvim'

" 彩色显示括号匹配
Plug 'luochen1990/rainbow'

" better % match
Plug 'andymass/vim-matchup'

" Signify (or just Sy) uses the sign column to indicate added,
" modified and removed lines in a file that is managed by a version control system (VCS).
Plug 'mhinz/vim-signify'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" A fancy, configurable, notification manager for NeoVim
Plug 'rcarriga/nvim-notify'

call plug#end()

" }}}

" plugins config ----------------------- {{{

" config of sonokai
if has('termguicolors')
    set termguicolors
endif
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"colorscheme sonokai

"let g:everforest_enable_italic = 1
"let g:everforest_better_performance = 1
"colorscheme everforest

" config of lightline
let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'

"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" 状态条定义
let g:lightline = {
            \ 'colorscheme': 'Tomorrow_Night_Blue',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'modified', 'cwd', 'path'] ],
            \   'right': [
            \              [ 'fileformat', 'fileencoding', 'filetype', 'totallines', 'length'] ,
            \              [ 'percent' ],
            \              [ 'lineinfo' ]
            \              ]
            \ },
            \ 'component': {
            \   'totallines': '%LL',
            \   'length'    : "%{line2byte('$') + len(getline('$'))}C",
            \   'cwd'       : '%{CurDir()}',
            \   'git'       : '%{FugitiveStatusline()}',
            \   'path'  : '%f'
            \ },
            \ 'component_function': {
            \   'gitbranch': 'Gitbr'
            \ },
            \}

" }}}

" coc config ----------------------- {{{

" ============================================================================ "
" ===                             COC SETUP                                === "
" ============================================================================ "
" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === key mappings === "
"   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-vetur'
      \ ]

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent>,a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent>,e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent>,c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent>,o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent>,s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent>,j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent>,k :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent>,p :<C-u>CocListResume<CR>

" }}}

" Vimrc autocommands ----------------------- {{{

augroup auto_grp
    au!
    autocmd BufNewFile,BufRead *.fish   set syntax=fish
    autocmd FileType vim,sh,conf setlocal foldmethod=marker

    " support css word with -
    autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
    autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

    " markdown 不折叠
    autocmd BufNewFile,BufRead *.md set nofoldenable

    autocmd BufWritePre * :%s/\s\+$//e

    "let g:user_emmet_expandabbr_key = '<c-e>'
    "autocmd FileType html,css,scss,eruby,php EmmetInstall

    " coffeescript
    "autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " hack filetype for slim
    autocmd BufNewFile,BufRead *.slim set filetype=slim
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript

augroup END

" }}}

" Vimrc keymaps ----------------------- {{{

inoremap jk <ESC>

map <c-o> :CtrlPBuffer<CR>

map <F3> <Esc>:call Comment()<CR>

"用空格键来开关折叠
"zr decreases the foldlevel by one.
"zm increases the foldlevel by one.
"zO opens all folds at the cursor.
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"""""""""""""""""""""""""""""
"插入模式映射
"
"增加缩进
inoremap <C-T> <ESC>>>i
"减少缩进
inoremap <C-B> <ESC><<i
"删除当前行
inoremap <C-D> <ESC>ddi

" 拷贝模式切换(关闭缩进参考线和行号, 也关闭signify的git diff指示符)
nnoremap <F9> :set number! relativenumber!<CR>:IndentBlanklineToggle<CR>:SignifyToggle<CR>:SignifyRefresh<CR>

" }}}

" other config ----------------------- {{{

source ~/.config/nvim/lua/init.lua
colorscheme nightfox

" }}}