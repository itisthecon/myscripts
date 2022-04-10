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

nmap <Leader>ti <cmd>IndentBlanklineToggle<CR>
nmap <Leader>tn <cmd>set number! relativenumber!<CR>

set mouse=
