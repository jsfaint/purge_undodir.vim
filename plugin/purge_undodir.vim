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

augroup purge_undodir
  autocmd!
  autocmd VimLeave * call purge_undodir#purge()
augroup END
