-- Ale Settings
vg.ale_completion_enabled = 1
vg.ale_completion_autoimport = 1
vim.opt.omnifunc='ale#completion#OmniFunc'

vg.ale_sign_column_always = 1
vg.ale_fix_on_save = 1
vg.ale_sign_error = '✗'
vg.ale_sign_warning = ''
vim.cmd[[
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'rust': ['rustfmt'],
    \}
]]
