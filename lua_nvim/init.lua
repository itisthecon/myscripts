-- misc pre config ----------------------- {{{

-- define vim global var prefix
vg = vim.g
-- call vim function prefix
vf = vim.fn

-- load pre-defined vim functions
vim.cmd 'source ~/.config/nvim/vim/funcs.vim'


vg.is_linux = vf.IsLinux()
vg.vimsyn_embed = 'l'

-- Ale settings
vg.ale_completion_enabled = 1
vg.ale_completion_autoimport = 1
vim.opt.omnifunc='ale#completion#OmniFunc'

-- }}}

-- requirements ----------------------- {{{

require 'user.settings'
require 'user.plugins'
require 'user.config.lightline'
require 'user.config.ale'
require 'user.config.indent-blankline'
-- pip install pynvim
vim.cmd 'source ~/.config/nvim/vim/coc_settings.vim'
require 'user.keymaps'
vim.cmd 'source ~/.config/nvim/vim/autocommands.vim'

-- }}}

-- theme config ----------------------- {{{

require 'user.config.nightfox'
vim.cmd 'colorscheme nightfox'

-- }}}

-- neovide config ----------------------- {{{

vg.neovide_transparency=0.85
vg.neovide_cursor_vfx_mode = 'torpedo'
vg.neovide_cursor_animation_length=0.07
vg.neovide_cursor_antialiasing=true
vg.neovide_cursor_vfx_opacity=200.0
vg.neovide_cursor_vfx_particle_lifetime=0.7

-- }}}
