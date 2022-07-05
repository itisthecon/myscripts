-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
vg = vim.g

-- Commentary plugin settings
augroup('Commentary', { clear = true })
autocmd('Filetype', {
      group = 'Commentary',
      pattern = { 'c',},
      command = [[setlocal commentstring=//\ %s]]
})

-- Do not use smart case in command line mode, extracted from https://vi.stackexchange.com/a/16511/15292.
augroup('dynamic_smartcase', { clear = true })
autocmd('CmdLineEnter', {
    group = 'dynamic_smartcase',
    command = 'set nosmartcase'
})
autocmd('CmdLineLeave', {
    group = 'dynamic_smartcase',
    command = 'set smartcase',
})

-- More accurate syntax highlighting? (see `:h syn-sync`)
augroup('accurate_syn_highlight', { clear = true })
autocmd('BufEnter', {
    group = 'accurate_syn_highlight',
    pattern = '*',
    command = ':syntax sync fromstart',
})

-- Return to last cursor position when opening a file
augroup('resume_cursor_position', { clear = true })
autocmd('BufReadPost', {
    group = 'resume_cursor_position',
    pattern = '*',
    command = 'call Resume_cursor_position()',
})

-- Display a message when the current file is not in utf-8 format.
-- Note that we need to use `unsilent` command here because of this issue:
-- https://github.com/vim/vim/issues/4379
-- augroup('non_utf8_file_warn', { clear = true })
-- autocmd('BufRead', {
 --    group = 'non_utf8_file_warn',
 --    pattern = '*',
 --    command = [[if &fileencoding != 'utf-8' | call v:lua.vim.notify('File not in UTF-8 format!', 'warn', {'title':↪'nvim-config'}) | endif]],
--})

-- Automatically reload the file if it is changed outside of Nvim, see
-- https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
-- command does not work in command line. We need to check if we are in command
-- line before executing this command. See also
-- https://vi.stackexchange.com/a/20397/15292.
augroup('auto_read', { clear = true })
autocmd('FileChangedShellPost', {
    group = 'auto_read',
    pattern = '*',
    command = [[call v:lua.vim.notify("File changed on disk. Buffer reloaded!", 'warn', {'title': 'nvim-↪config'})]],
})
autocmd({'FocusGained', 'CursorHold'}, {
    group = 'auto_read',
    pattern = '*',
    command = [[if getcmdwintype() == '' | checktime | endif]],
})


augroup('numbertoggle', { clear = true })
autocmd({'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter'}, {
    group = 'numbertoggle',
    pattern = '*',
    command = [[if &nu | set rnu   | endif]],
})
autocmd({'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave'}, {
    group = 'numbertoggle',
    pattern = '*',
    command = [[if &nu | set nornu | endif]],
})

-- Define or override some highlight groups
augroup('custom_highlight', { clear = true })
autocmd('ColorScheme', {
      group = 'custom_highlight',
      pattern = '*',
      command = 'call Custom_highlight()',
})

-- highlight yanked region, see `:h lua-highlight`
augroup('highlight_yank', { clear = true })
autocmd('TextYankPost', {
      group = 'highlight_yank',
      pattern = '*',
      command = [[silent! lua vim.highlight.on_yank{higroup="YankColor", timeout=300, on_visual=false}]],
})

augroup('auto_grp', { clear = true })
autocmd({'BufNewFile', 'BufRead'}, {
     group = 'auto_grp',
     pattern = '*.fish',
     command = 'set syntax=fish',
})
autocmd({'FileType'}, {
     group = 'auto_grp',
     pattern = { 'vim', 'sh', 'conf', 'lua'},
     command = 'setlocal foldmethod=marker',
})
-- support css word with -
autocmd({'FileType'}, {
     group = 'auto_grp',
     pattern = { 'css', 'scss', 'slim', 'html', 'eruby', 'coffee', 'javascript' },
     command = 'setlocal iskeyword+=-',
})
autocmd({'Filetype'}, {
     group = 'auto_grp',
     pattern = { 'python', },
     command = 'setlocal tabstop=4 shiftwidth=4 softtabstop=4',
})
-- markdown 不折叠
autocmd({'BufNewFile', BufRead}, {
     group = 'auto_grp',
     pattern = '*.md',
     command = 'set nofoldenable',
})
autocmd({'BufWritePre'}, {
     group = 'auto_grp',
     pattern = '*',
     command = [[:%s/\s\+$//e]],
})
-- hack filetype for slim
autocmd({'BufNewFile', 'BufRead'}, {
     group = 'auto_grp',
     pattern = '*.slim',
     command = 'set filetype=slim',
})
autocmd({'BufNewFile', 'BufRead'}, {
     group = 'auto_grp',
     pattern = '*.es6',
     command = 'set filetype=javascript',
})

--[[
augroup('', { clear = true })
autocmd('', {
      group = '',
      pattern = '*',
      command = '',
})
autocmd({''}, {
     group = '',
     pattern = '*',
     command = '',
})
]]--
