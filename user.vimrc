" Vimrc file settings ---------------------- {{{
set rtp+=~/.vim/bundle/Vundle.vim
" hightlight column and line
set cursorline
"set cursorcolumn

" vim 7.4 backspace fix
set backspace=indent,eol,start
set t_Co=256
" colorscheme, read here: http://vim.wikia.com/wiki/Change_the_color_scheme
set background=dark
"colorscheme molokai
"显示行号
"set nu

"缩写是fdm
"set foldmethod=indent
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码
"set foldclose=all          " 设置为自动关闭折叠

" vim rails syntax complete, try ctrl+x ctrl+u
set completefunc=syntaxcomplete#Complete

"Ack的快捷键设置为F4
":map <F4> :Ack -i<Space>
if has("gui_running")
    colorscheme desert
    set bs=2
    set ruler
    set gfn=Monaco:h16
    set shell=/bin/bash
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"搜索高亮颜色
hi Search ctermbg=LightYellow
hi Search ctermfg=DarkRed

filetype plugin indent on

" }}}
" Vimrc file plugins ----------------------- {{{
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"兼容源代码目录中的.editorcontig配置
Plugin 'editorconfig/editorconfig-vim'

"Laravel Blade模板语法高亮设置
Plugin 'jwalton512/vim-blade'

"一些几乎通用的设置包装成此插件
Plugin 'tpope/vim-sensible'

"支持使用.来重复执行一些插件的命令（如speeddating, surround等)
Plugin 'tpope/vim-repeat'

"用来加括号，引号，前后缀等等，写XML很有用（特别是配合repeat）
Plugin 'tpope/vim-surround'

"自动补全引号括号等
Bundle 'Raimondi/delimitMate'

"异步运行测试，并在分屏中看到测试的输出
Plugin 'tpope/vim-dispatch'

"自动补全YCM
"Bundle 'Valloric/YouCompleteMe'

"标签跳转扩展
Bundle 'vim-scripts/matchit.zip'

"fish syntax扩展
Bundle 'dag/vim-fish'

"CSS color show(css颜色显示) 将css/sass/less中的颜色用背景色高亮出来方便预览
Plugin 'gorodinskiy/vim-coloresque'

"以下5行是代码补全snipmate相关的插件
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

"Ack全局搜索插件 !!!使用前需apt install ack
Plugin 'mileszs/ack.vim'
" git
Plugin 'tpope/vim-fugitive'

" ruby command for rvm
Plugin 'tpope/vim-rvm'

" 快速移动光标, 往前移动,,w 往后移动,,b 搜索跳转,,s 行级跳转,,j前跳 ,,k后跳
" 行内跳转,,h前跳 ,,l后跳
Plugin 'Lokaltog/vim-easymotion'

" power vim plugin for rails
Plugin 'tpope/vim-rails.git'

"状态栏相关设置
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'

" quickly comment your code, try ,cc on selected line
Plugin 'vim-scripts/The-NERD-Commenter'

Plugin 'nathanaelkane/vim-indent-guides'

" markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" sass highlight
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'isRuslan/vim-es6'

"""""""""""""""
"md相关插件
"Plugin 'suan/vim-instant-markdown'
"""""""""""""""

" coffeescript
Plugin 'kchmck/vim-coffee-script'

" quickly search file(s), use ctrl+p, F5 refresh
" 快速搜索打开文件
Plugin 'kien/ctrlp.vim'

" slim template support
Plugin 'slim-template/vim-slim.git'

" basic dependence 基本实用功能库
Plugin 'L9'

Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'

Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()
" }}}
" Vimrc autocommands ----------------------- {{{

augroup auto_grp
    au!
    autocmd BufNewFile,BufRead *.fish   set syntax=fish
    autocmd FileType vim setlocal foldmethod=marker

    " support css word with -
    autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
    autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

    " markdown 不折叠
    autocmd BufNewFile,BufRead *.md set nofoldenable

    autocmd BufWritePre * :%s/\s\+$//e

    "let g:user_emmet_expandabbr_key = '<c-e>'
    autocmd FileType html,css,scss,eruby,php EmmetInstall

    " coffeescript
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " hack filetype for slim
    autocmd BufNewFile,BufRead *.slim set filetype=slim
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript

augroup END

" }}}
" Vimrc keymaps ----------------------- {{{
inoremap jk <ESC>

" indent guides shortcut
map <silent><F7>  <leader>ig

" file tree like something called IDE
" Ctrl+w+l 切换到右边窗口
" Ctrl+w+h 切换到左边窗口
" Ctrl+w+w 左右切换
map <silent><F8> :NERDTree<CR>
map <leader>r :NERDTreeFind<cr>
map <leader>e :NERDTreeToggle<cr>
map <leader>y "+y<cr>
map <leader>p "+p<cr>

"map <F5> <Esc>:EnableFastPHPFolds<Cr>
"map <F6> <Esc>:EnablePHPFolds<Cr>
map <F5> <Esc>:EnablePHPFolds<Cr>
map <F6> <Esc>:DisablePHPFolds<Cr>

map <c-o> :CtrlPBuffer<CR>

map <F3> <Esc>:call Comment()<CR>
nmap <C-a> <Esc>:call Newfunc()<CR>

"用空格键来开关折叠
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

" }}}
" Vimrc variables ----------------------- {{{

let mapleader= ","
" quickly write HTML, just like zencoding but simple engough
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"let g:sparkupNextMapping= "<c-m>"
let g:user_emmet_install_global = 0
let g:user_emmet_mode='iv'

" indent guides 缩进标尺
let g:indent_guides_guide_size = 1
let NERDTreeShowHidden=1 "默认显示隐藏文件

" quickly search file(s), use ctrl+p, F5 refresh
" 快速搜索打开文件
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn)|(optimized|compiled|node_modules|bower_compenents)$'

let php_folding=0
let DisableAutoPHPFolding = 0

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
"enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" }}}
" Vimrc functions ----------------------- {{{

function! Comment()
    r~/.vim/php/comment.txt
endfunction


function! Newfunc()
    r~/.vim/php/newfunc.txt
endfunction

" 状态条git分支显示
function Gitbr()
    let branchname = gitbranch#name()
    if strlen(branchname) < 1
        return ""
    endif
    return ' ' . branchname
endfunction

let g:indent_guides_enable_on_vim_startup = 1
" }}}
