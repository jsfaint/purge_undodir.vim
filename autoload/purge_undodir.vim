"============================================================================
" File: purge_undodir.vim
" Author: Jia Sui <jsfaint@gmail.com>
" Description: Purge undofile which the original file doesn't exist anymore
"============================================================================
"
"without persistent_undo support or disabled
if !has('persistent_undo') || ! &undofile
  finish
endif

"undodir not set
if empty(&undodir)
  finish
endif

if ! isdirectory(&undodir)
  finish
endif

function! s:purge_file(file) abort
  if has('win32')
    let l:filepath = substitute(a:file, '%%', ':\\', 'g')
    let l:filepath = substitute(l:filepath, '%', '\\', 'g')
  else
    let l:filepath = substitute(a:file, '%', '/', 'g')
  endif

  "if file not exist, delete the undofile
  if ! filereadable(l:filepath)
    call delete(a:file)
  endif
endfunction

function! purge_undodir#purge() abort
  "change cwd
  execute 'lcd ' . &undodir

  for l:file in split(glob('*', 0), '\n')
    call s:purge_file(l:file)
  endfor

  "resotre cwd
  execute 'lcd -'
endfunction
