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
" cd ~/.config/nvim/plugged/coc.nvim/
" yarn install
" yarn build
"
"  in ~/.config/nvim/plugged/
"  git clone -b release https://github.com/neoclide/coc.nvim.git

" init setting ----------------------- {{{

let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false

" Ale settings
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

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

let g:signify_disable_by_default = 0

" neovide config
let g:neovide_transparency=0.85
let g:neovide_cursor_vfx_mode = 'torpedo'
let g:neovide_cursor_animation_length=0.07
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_opacity=200.0
let g:neovide_cursor_vfx_particle_lifetime=0.7
" }}}
