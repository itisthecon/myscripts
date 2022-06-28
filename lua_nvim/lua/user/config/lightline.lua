-- lightline set
vg.lightline = {
    colorscheme = 'one',

    active = {
        left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'modified', 'cwd', 'path' } },
        right = {
            { 'fileformat', 'fileencoding', 'filetype', 'totallines', 'length' },
            { 'percent' },
            { 'lineinfo' }
        },
    },

    component = {
        totallines = '%LL',
        length = [[ %{line2byte('$') + len(getline('$'))}C  ]],
        cwd = '%{CurDir()}',
        git = '%{FugitiveStatusline()}',
        path = '%f'
    },

    component_function = {
        gitbranch = 'Gitbr'
    }
}
