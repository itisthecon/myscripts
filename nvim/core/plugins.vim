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

" The missing auto-completion for cmdline!
Plug 'gelguy/wilder.nvim'

" A fancy, configurable, notification manager for NeoVim
Plug 'rcarriga/nvim-notify'

" displays a popup with possible key bindings of the command you started typing.
Plug 'folke/which-key.nvim'

" Repeat vim motions
Plug 'tpope/vim-repeat'

"CSS color show(css颜色显示) 将css/sass/less中的颜色用背景色高亮出来方便预览
"Plugin 'gorodinskiy/vim-coloresque'
Plug 'ap/vim-css-color'

call plug#end()
