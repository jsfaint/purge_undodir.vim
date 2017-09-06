"============================================================================
" File: purge_undodir.vim
" Author: Jia Sui <jsfaint@gmail.com>
" Description: Purge undofile which the original file doesn't exist anymore
"============================================================================

augroup purge_undodir
  autocmd!
  autocmd VimLeave * call purge_undodir#purge()
augroup END
