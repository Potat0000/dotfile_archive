" 增强 Unicode 的使用
Plug 'chrisbra/unicode.vim'


" 状态栏
Plug 'vim-airline/vim-airline'

let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>


" 增加AirLine主题
Plug 'vim-airline/vim-airline-themes'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.theme.vim'
