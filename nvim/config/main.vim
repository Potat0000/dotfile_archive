scriptencoding utf-8

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Plugin.vim'

filetype plugin indent on

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Color.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Extend.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/autocmd.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/map.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Other.vim'
