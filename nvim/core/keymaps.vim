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
