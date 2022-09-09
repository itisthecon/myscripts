-- mcd ~/.local/share/nvim/site/autoload
-- wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
-- mcd ~/.config/
-- ln -s /data/soft/git/myscripts/lua_nvim/init.lua
-- ln -s /data/soft/git/myscripts/lua_nvim/lua
-- ln -s /data/soft/git/myscripts/lua_nvim/vim
--
--debian install new version nodejs:
--curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
--bash nodesource_setup.sh
--
-- apt install nodejs npm python3-pyx
-- pip install pynvim python3-pip
--
--

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

-- plugin configs
require 'user.config'

-- }}}

-- theme config ----------------------- {{{

-- local colorscheme = 'nightfox'
local colorscheme = 'kanagawa'
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. "not found!", "error")
    return
end

-- }}}

-- neovide config ----------------------- {{{

vg.neovide_transparency=0.85
vg.neovide_cursor_vfx_mode = 'torpedo'
vg.neovide_cursor_animation_length=0.07
vg.neovide_cursor_antialiasing=true
vg.neovide_cursor_vfx_opacity=200.0
vg.neovide_cursor_vfx_particle_lifetime=0.7

-- }}}
