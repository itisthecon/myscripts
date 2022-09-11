local backup_dir = data_dir .. '/user/backup'
local swap_dir = data_dir .. '/user/swap'
local undo_dir = data_dir .. '/user/undo'

-- ensure vim runtime dirctory exist
vf.EnsureDirExists(backup_dir)
vf.EnsureDirExists(swap_dir)
vf.EnsureDirExists(undo_dir)

local set = vim.opt

-- set.dirctory = swap_dir

local options = {
    mouse = '',

    -- set dirs
    undodir = undo_dir,
    backupdir = backup_dir,
    directory = swap_dir,

    -- Paste mode toggle, it seems that Nvim's bracketed paste mode
    -- does not work very well for nvim-qt, so we use good-old paste mode
    pastetoggle = '<F3>',

    -- Split window below/right when creating horizontal/vertical windows
    splitbelow = true,
    splitright = true,

    -- Time in milliseconds to wait for a mapped sequence to complete,
    -- see https://unix.stackexchange.com/q/36882/221410 for more info
    timeoutlen = 500,
    -- For CursorHold events
    updatetime = 500,

    -- General tab settings
    tabstop = 4,
    softtabstop = 4,
    shiftwidth =  4,
    expandtab = true,

    -- Show line number and relative line number
    number = true,
    relativenumber = true,

    -- Ignore case in general, but become case-sensitive when uppercase is present
    ignorecase = true,
    smartcase = true,

    -- File and script encoding settings for vim
    fileencoding = 'utf-8',
    fileencodings = 'ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1',

    -- Break line at predefined characters
    linebreak = true,

    -- Character to show before the lines that have been soft-wrapped
    showbreak = '↪',

    -- List all matches and complete till longest common string
    wildmode = 'list:longest',

    -- Minimum lines to keep above and below cursor when scrolling
    scrolloff = 3,

    -- Disable showing current mode on command line since statusline plugins can show it.
    showmode = false,

    --  Fileformats to use for new files
    fileformats = 'unix,dos',

    -- Ask for confirmation when handling unsaved or read-only files
    confirm = true,

    -- Do not use visual and errorbells
    visualbell = true,
    errorbells = false,

    -- The number of command and search history to keep
    history = 9000,

    -- Use list mode and customized listchars
    list = true,
    --listchars = [[tab:→\ ,extends:❯,precedes:❮,nbsp:␣]],
    --listchars = [[tab:→\,space:·,nbsp:␣,eol:↲,extends:❯,precedes:❮]],

    -- Show hostname, full path of file and last-mod time on the window title. The
    -- meaning of the format str for strftime can be found in
    -- http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
    -- lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
    title = true,
    titlestring = '',

    -- Persistent undo even after you close a file and re-open it
    undofile = true,

    -- hightlight column and line 高亮光标所在的行
    cursorline = true,
    --
    -- shows  the effects of a command
    -- in a partial off-screen results in a preview window.
    icm='split'
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- 搜索高亮颜色
vim.cmd[[hi Search ctermbg=LightYellow]]
vim.cmd[[hi Search ctermfg=DarkRed]]

set.matchpairs:append [[<:>,「:」,『:』,【:】,“:”,‘:’,《:》]]

-- Enables 24-bit RGB color in the TUI.
if vf.has('termguicolors') then
    set.termguicolors = true
end

--  allows users to select what, if any, types of
--  embedded script highlighting they wish to have.
vg.vimsyn_embed = 'lPr'
