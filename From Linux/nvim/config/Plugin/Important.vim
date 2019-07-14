" 增强 Unicode 的使用
call dein#add('chrisbra/unicode.vim')


" 状态栏
call dein#add('vim-airline/vim-airline')

let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>


" 增加AirLine主题
call dein#add('vim-airline/vim-airline-themes')


" 主题
call dein#add('chriskempson/vim-tomorrow-theme')
call dein#add('altercation/vim-colors-solarized')
call dein#add('tomasr/molokai')
