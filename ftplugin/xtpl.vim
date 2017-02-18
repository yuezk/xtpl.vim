" Vim ftplugin file
" Language: XTemplate
" Maintainer: Kevin Yue <yuezk001@gmail.com>

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Load html ftplugins
runtime! ftplugin/html.vim ftplugin/html/*.vim
