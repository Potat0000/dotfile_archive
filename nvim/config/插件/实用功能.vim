" Ctrl-P 超级搜索
Plug 'kien/ctrlp.vim', {'on': '<Plug><C-P>'}


" 使用ag加快CtrlP的查找速度
Plug 'rking/ag.vim', {'on': '<Plug><C-P>'}

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -g "" --nocolor --nogroup --follow --hidden --smart-case'
else
  let g:ctrlp_user_command = 'cd %s && git ls-files --exclude-standard --others | sort'
endif


" 为CtrlP插件拓展功能
"Plug 'sgur/ctrlp-extensions.vim', {'on': '<Plug><C-P>'}


" 撤销树
Plug 'sjl/gundo.vim', { 'on': '<Plug><Leader>u' }


" 提供免干扰的写作环境
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }


" 配合 Goyo 提供行聚焦
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }


" 快速移动
Plug 'easymotion/vim-easymotion', { 'on': ['<Plug><Leader><Leader>f', '<Plug><Leader><Leader>w'] }


" 新建文件时自动创建不存在的文件夹
Plug 'pbrisbin/vim-mkdir'


" 目录树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

"autocmd BufRead * 25vsp  ./
"autocmd vimenter * if !argc() | NERDTree | endif                                                                          " 未指定文件打开(n)vim时自动打开NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif             " 如果NERDTree是最后一个窗口，则退出(n)vim
"nmap <F1> :NERDTreeToggle<cr>
