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
" pip install -U pynvim
" pip install 'python-lsp-server[all]' pylsp-mypy pyls-isort
" apt install nodejs npm
" npm install -g vim-language-server
" set lua/config/autosave.lua enabled=false
" 修改 lua/plugins.lua 禁止autosave


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

let g:loaded_ruby_provider=1
let g:ruby_host_prog = '~/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#282c34 ctermbg=none  cterm=none
highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight NERDTreeClosable guifg=#98be65 ctermfg=2
highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#1c1f24 ctermbg=none  cterm=none


" neovide specialized set
if exists('g:neovide')
  let g:neovide_transparency=0.9
  let g:neovide_no_idle=v:true
  let g:neovide_remember_window_size = v:true
  let g:neovide_cursor_animation_length=0.2
  let g:neovide_cursor_trail_length=0.3
  let g:neovide_cursor_antialiasing=v:true
  let g:neovide_cursor_vfx_mode = "railgun"
  
  "set mouse=nicr
  set mouse=a
endif

" " Paste from clipboard
nnoremap <leader>p "*p
nnoremap <leader>P "+P
vnoremap <leader>p "*p
vnoremap <leader>P "+P

" ensure vim runtime dirctory exist
call EnsureDirExists($HOME . '/.nvim/backup')
call EnsureDirExists($HOME . '/.nvim/swap')
call EnsureDirExists($HOME . '/.nvim/undo')
