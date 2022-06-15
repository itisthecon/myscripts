function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

" 状态条git分支显示
function Gitbr()
    let branchname = gitbranch#name()
    if strlen(branchname) < 1
        return ""
    endif
    return ' ' . branchname
endfunction

"确保备份交换和undo目录存在
function! EnsureDirExists (dir)
   if !isdirectory(a:dir)
     if exists("*mkdir")
       call mkdir(a:dir,'p')
       echo "Created directory: " . a:dir
     else
       echo "Please create directory: " . a:dir
     endif
   endif
endfunction

function! Get_titlestr() abort
  let l:title_str = ''
  if g:is_linux
      let l:title_str = hostname() . '  '
  endif
  let l:title_str = l:title_str . expand('%:p:~') . '  '
  if &buflisted
    let l:title_str = l:title_str . strftime('%Y-%m-%d %H:%M',getftime(expand('%')))
  endif

  return l:title_str
endfunction

function! Add_pack(name) abort
  let l:status = v:true

  return l:status
endfunction

" Generate random integers in the range [Low, High] in pure vim script,
" adapted from https://stackoverflow.com/a/12739441/6064933
function! RandInt(Low, High) abort
  " Use lua to generate random int. It is faster. Ref: https://stackoverflow.com/a/20157671/6064933
  call v:lua.math.randomseed(localtime())
  return v:lua.math.random(a:Low, a:High)
endfunction

" Selection a random element from a sequence/list
function! RandElement(seq) abort
  let l:idx = RandInt(0, len(a:seq)-1)

  return a:seq[l:idx]
endfunction

" Toggle signcolumn. Works on vim>=8.1 or NeoVim
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=number
        let b:signcolumn_on=1
    endif
endfunction
