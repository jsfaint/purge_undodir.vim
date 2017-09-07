"============================================================================
" File: purge_undodir.vim
" Author: Jia Sui <jsfaint@gmail.com>
" Description: Purge undofile which the original file doesn't exist anymore
"============================================================================

"Without persistent_undo support or disabled
if !has('persistent_undo') || ! &undofile
  finish
endif

"Undodir not set
if empty(&undodir)
  finish
endif

"Not exist or not directory
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

  "If file not exist, delete the undofile
  if ! filereadable(l:filepath)
    call delete(a:file)
  endif
endfunction

function! purge_undodir#purge() abort
  "Change cwd
  execute 'lcd ' . &undodir

  for l:file in split(glob('*', 0), '\n')
    call s:purge_file(l:file)
  endfor

  "Resotre cwd
  execute 'lcd -'
endfunction
