inoremap jk <ESC>
"显示行号
"set nu

" hightlight column and line
set cursorline
"set cursorcolumn
filetype plugin indent on

" support css word with -
autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" markdown 不折叠
autocmd BufNewFile,BufRead *.md set nofoldenable

" vim 7.4 backspace fix
set backspace=indent,eol,start
set t_Co=256
" colorscheme, read here: http://vim.wikia.com/wiki/Change_the_color_scheme
set background=dark
"colorscheme molokai
autocmd BufWritePre * :%s/\s\+$//e

set rtp+=~/.vim/bundle/Vundle.vim
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
"Ack的快捷键设置为F4
":map <F4> :Ack -i<Space>
if has("gui_running")
  colorscheme desert
  set bs=2
  set ruler
  set gfn=Monaco:h16
  set shell=/bin/bash
endif

let mapleader= ","
" git
Plugin 'tpope/vim-fugitive'

" ruby command for rvm
Plugin 'tpope/vim-rvm'

" 快速移动光标, 往前移动,,w 往后移动,,b 搜索跳转,,s 行级跳转,,j前跳 ,,k后跳
" 行内跳转,,h前跳 ,,l后跳
Plugin 'Lokaltog/vim-easymotion'

" quickly write HTML, just like zencoding but simple engough
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"let g:sparkupNextMapping= "<c-m>"
Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
let g:user_emmet_mode='iv'
"let g:user_emmet_expandabbr_key = '<c-e>'
autocmd FileType html,css,scss,eruby,php EmmetInstall

" power vim plugin for rails
Plugin 'tpope/vim-rails.git'

" vim rails syntax complete, try ctrl+x ctrl+u
set completefunc=syntaxcomplete#Complete

" quickly comment your code, try ,cc on selected line
Plugin 'vim-scripts/The-NERD-Commenter'

" indent guides 缩进标尺
let g:indent_guides_guide_size = 1
"vim启动时启用插件
"let g:indent_guides_enable_on_vim_startup = 1
Plugin 'nathanaelkane/vim-indent-guides'
" indent guides shortcut
map <silent><F7>  <leader>ig

" markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" file tree like something called IDE
" Ctrl+w+l 切换到右边窗口
" Ctrl+w+h 切换到左边窗口
" Ctrl+w+w 左右切换
Plugin 'scrooloose/nerdtree'
map <silent><F8> :NERDTree<CR>
map <leader>r :NERDTreeFind<cr>
map <leader>e :NERDTreeToggle<cr>
map <leader>y "+y<cr>
map <leader>p "+p<cr>
let NERDTreeShowHidden=1 "默认显示隐藏文件

" coffeescript
Plugin 'kchmck/vim-coffee-script'
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" basic dependence 基本实用功能库
Plugin 'L9'

" slim template support
Plugin 'slim-template/vim-slim.git'
" hack filetype for slim
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.es6 set filetype=javascript

" quickly search file(s), use ctrl+p, F5 refresh
" 快速搜索打开文件
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn)|(optimized|compiled|node_modules|bower_compenents)$'
map <c-o> :CtrlPBuffer<CR>

" sass highlight
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'isRuslan/vim-es6'

"""""""""""""""
"md相关插件
"Plugin 'suan/vim-instant-markdown'
"""""""""""""""
call vundle#end()

"缩写是fdm
"set foldmethod=indent
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
"用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
let php_folding=0
let DisableAutoPHPFolding = 0
"map <F5> <Esc>:EnableFastPHPFolds<Cr>
"map <F6> <Esc>:EnablePHPFolds<Cr>
map <F5> <Esc>:EnablePHPFolds<Cr>
map <F6> <Esc>:DisablePHPFolds<Cr>

function! Comment()
    r~/.vim/php/comment.txt
endfunction

map <F3> <Esc>:call Comment()<CR>

function! Newfunc()
    r~/.vim/php/newfunc.txt
endfunction

nmap <C-a> <Esc>:call Newfunc()<CR>

"搜索高亮颜色
hi Search ctermbg=LightYellow
hi Search ctermfg=DarkRed

filetype plugin on
