# purge_vim_undodir.vim

Inspired by https://blog.debiania.in.ua/posts/2012-07-31-purging-vim-undodir.html

Implement it with pure vimscript for multiple platform support.

## Usage

This plugin will running on `VimLeave`.<br>
When you exit vim it will purge undofile which the original file doesn't exist anymore.
