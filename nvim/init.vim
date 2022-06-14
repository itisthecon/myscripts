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
"
"  in ~/.config/nvim/plugged/
"  git clone -b release https://github.com/neoclide/coc.nvim.git

" init setting ----------------------- {{{

let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false

let s:core_conf_files = [
      \ 'funcs.vim',
      \ 'settings.vim',
      \ 'plugins.vim',
      \ 'plugin_settings.vim',
      \ 'coc_settings.vim',
      \ 'keymaps.vim',
      \ 'autocommands.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor


" }}}

" other config ----------------------- {{{

source ~/.config/nvim/lua/init.lua
colorscheme nightfox

" }}}
