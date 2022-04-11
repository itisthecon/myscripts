" This is my personal Nvim configuration supporting Mac, Linux and Windows, with various plugins configured.
" This configuration evolves as I learn more about Nvim and become more proficient in using Nvim.
" Since it is very long (more than 1000 lines!), you should read it carefully and take only the settings that suit you.
" I would not recommend cloning this repo and replace your own config. Good configurations are personal,
" built over time with a lot of polish.
"
" Author: Jie-dong Hao
" Email: jdhao@hotmail.com
" Blog: https://jdhao.github.io/
" clone from https://github.com/jdhao/nvim-config.git
" git clone https://github.com/jdhao/nvim-config.git ~/.config/nvim/
" set lua/config/autosave.lua enabled=false


let s:core_conf_files = [
      \ 'globals.vim',
      \ 'options.vim',
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ 'themes.vim'
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

set undodir=~/.nvim/undo
set backupdir=~/.nvim/backup
set directory=~/.nvim/swap
let g:auto_save=0
unmap Y
"unmap %
"autocmd VimEnter unmap! %

" " 切换缩进参考线
" nmap <Leader>ti <cmd>IndentBlanklineToggle<CR>
" " 切换行号和相对行号
" nmap <Leader>tn <cmd>set number! relativenumber!<CR>

" 拷贝模式切换(关闭缩进参考线和行号, 也关闭signify的git diff指示符)
nmap <Leader>tc <cmd>IndentBlanklineToggle<CR> <cmd>set number! relativenumber!<CR> <cmd>SignifyToggle<CR>

set mouse=

" hightlight column and line
" 高亮光标所在的行
set cursorline

" jdhao/better-escape.vim 设置
let g:better_escape_shortcut = 'jk'
" set time interval to 200 ms
let g:better_escape_interval = 200

let g:loaded_matchit = 1

" do it for % match work, don't know why
autocmd VimEnter * unmap %
