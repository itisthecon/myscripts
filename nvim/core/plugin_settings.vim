" config of sonokai
if has('termguicolors')
    set termguicolors
endif
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"colorscheme sonokai

"let g:everforest_enable_italic = 1
"let g:everforest_better_performance = 1
"colorscheme everforest

" config of lightline
let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'

"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

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

