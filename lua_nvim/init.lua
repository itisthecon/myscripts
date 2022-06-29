-- misc pre config ----------------------- {{{

-- define vim global var prefix
vg = vim.g
-- call vim function prefix
vf = vim.fn

-- user nvim config dir
config_dir = vf.stdpath("config")
-- user nvim data dir
data_dir = vf.stdpath("data")

-- }}}

-- requirements ----------------------- {{{

-- load pre-defined vim functions
vim.cmd  ('source ' .. config_dir .. '/vim/funcs.vim')

-- user plugins , settings, and keymaps
require 'user'

-- pip install pynvim
vim.cmd  ('source ' .. config_dir .. '/vim/coc_settings.vim')
vim.cmd  ('source ' .. config_dir .. '/vim/autocommands.vim')

-- plugin configs
require 'user.config'

-- }}}

-- theme config ----------------------- {{{

-- vim.cmd 'colorscheme nightfox'
vim.cmd 'colorscheme kanagawa'

-- }}}

-- neovide config ----------------------- {{{

vg.neovide_transparency=0.85
vg.neovide_cursor_vfx_mode = 'torpedo'
vg.neovide_cursor_animation_length=0.07
vg.neovide_cursor_antialiasing=true
vg.neovide_cursor_vfx_opacity=200.0
vg.neovide_cursor_vfx_particle_lifetime=0.7

-- }}}
