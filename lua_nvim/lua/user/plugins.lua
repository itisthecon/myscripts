local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'

  -- Speed up loading Lua modules in Neovim to improve startup time.
  use 'lewis6991/impatient.nvim'

  -- rust releated
  use 'rust-lang/rust.vim'
  use 'cespare/vim-toml'

  -- A (Neo)vim plugin for formatting code. :Neoformat
  use 'sbdchd/neoformat'

  -- Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
  -- It expands on the idea of simple commands like di'
  use 'wellle/targets.vim'

  -- sandwich.vim is a set of operator and textobject plugins to
  -- add/delete/replace surroundings of a sandwiched textobject, like (foo), 'bar'.
  -- Press sa{motion/textobject}{addition}. For example, a key sequence saiw( makes foo to (foo).
  -- Press sdb or sd{deletion}. For example, key sequences sdb or sd( makes (foo) to foo.
  use 'machakann/vim-sandwich'

  -- themes..
  use 'sainnhe/sonokai'
  use 'lifepillar/vim-gruvbox8'
  use 'sainnhe/gruvbox-material'
  use 'navarasu/onedark.nvim'
  use 'sainnhe/edge'
  use 'shaunsingh/nord.nvim'
  use 'NTBBloodbath/doom-one.nvim'
  use 'sainnhe/everforest'
  use 'EdenEast/nightfox.nvim'
  use 'rebelot/kanagawa.nvim'

  -- 状态栏相关设置
  use 'itchyny/lightline.vim'
  use 'itchyny/vim-gitbranch'
  use 'ryanoasis/vim-devicons'

  -- 根据符号多行对齐, 使用方法:
  -- 按 => 对齐为例
  -- :Tabularize /=>
  --  :help tabular
  use 'godlygeek/tabular'

  -- 用gcc来注释一行（需要计数）
  use 'tpope/vim-commentary'


  -- 用来加括号，引号，前后缀等等，写XML很有用（特别是配合repeat）
  -- cs"'               双引号转单引号
  -- cs'<q>             单引号转<q></q>
  -- cst"               再转回来
  -- ds"                删掉双引号
  -- ys<text-obj>"      添加符号,比如ysid" -- 给当前句子加上引号
  -- 快速改变surroud符号，比如 cs(' 把()改成''
  use 'tpope/vim-surround'

  -- 兼容源代码目录中的.editorcontig配置
  use 'editorconfig/editorconfig-vim'

  -- 自动补全引号括号等
  use 'Raimondi/delimitMate'

  -- fish syntax扩展
  use 'dag/vim-fish'

  -- 
  use 'ntpeters/vim-better-whitespace'
  -- 
  use 'lukas-reineke/indent-blankline.nvim'

  -- 彩色显示括号匹配
  use 'luochen1990/rainbow'

  -- better % match
  use 'andymass/vim-matchup'

  -- Signify (or just Sy) uses the sign column to indicate added,
  -- modified and removed lines in a file that is managed by a version control system (VCS).
  use 'mhinz/vim-signify'

  use {'neoclide/coc.nvim', branch = 'release'}

  -- The missing auto-completion for cmdline!
  use 'gelguy/wilder.nvim'

  -- A fancy, configurable, notification manager for NeoVim
  use 'rcarriga/nvim-notify'

  -- displays a popup with possible key bindings of the command you started typing.
  use 'folke/which-key.nvim'

  -- Repeat vim motions
  use 'tpope/vim-repeat'

  -- CSS color show(css颜色显示) 将css/sass/less中的颜色用背景色高亮出来方便预览
  use 'ap/vim-css-color'

--  use {
--    'glacambre/firenvim',
--    run = function() vim.fn['firenvim#install'](0) end
--    }
--

  -- ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors)
  use 'dense-analysis/ale'

  --
  -- use ''

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

