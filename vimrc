set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'     " Python自动缩进
"Plugin 'scrooloose/syntastic'            " 语法检查、高亮
"Plugin 'nvie/vim-flake8'                 " PEP8代码风格检查
Plugin 'SirVer/ultisnips'                 " 代码块
Plugin 'honza/vim-snippets'               " 代码块
Plugin 'tomasr/molokai'                   " 配色方案
Plugin 'kien/ctrlp.vim'                   " Ctrl-P 超级搜索
Plugin 'klen/python-mode'                 " Python插件
Plugin 'scrooloose/nerdtree'              " 目录树
Plugin 'pbrisbin/vim-mkdir'               " 新建文件时自动创建不存在的文件夹
Plugin 'sjl/gundo.vim'                    " 撤销树
Plugin 'easymotion/vim-easymotion'        " 快速移动
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'          " Markdown高亮

call vundle#end()
filetype plugin indent on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

""""""""""""""" 永久撤销记录
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
""""""""""""""" 永久撤销记录

""""""""""""""" PowerLine

set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim
set nocompatible
set t_Co=256
    
let g:minBufExplForceSyntaxEnable = 1
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
    
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
    
set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode
""""""""""""""" PowerLine

""""""""""""""" 分割区移动
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""""""""""""""" 分割区移动

""""""""""""""" 启用代码折叠
set foldmethod=indent
set foldlevel=99
nnoremap <space> za     " 使用空格键折叠代码
""""""""""""""" 启用代码折叠

""""""""""""""" 设置代码缩进、保存
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
""""""""""""""" 设置代码缩进、保存格式

""""""""""""""" 配色方案
set background=dark
colorscheme molokai
""""""""""""""" 配色方案

""""""""""""""" Python虚拟环境(Virtualenv)支持
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
""""""""""""""" Python虚拟环境(Virtualenv)支持

""""""""""""""" Syntastic
"let g:syntastic_check_on_open = 1
"let g:syntastic_error_symbol = '✘'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
""""""""""""""" Syntastic

""""""""""""""" NerdTree
"autocmd BufRead *  25vsp  ./
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>
""""""""""""""" NerdTree

""""""""""""""" PyMode
let g:pymode_lint_todo_symbol = '⚠'
let g:pymode_lint_comment_symbol = '☯'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = '✘'
let g:pymode_lint_info_symbol = 'ⅰ'
let g:pymode_lint_pyflakes_symbol = 'FF'

let g:pymode_options_max_line_length = 255
""""""""""""""" PyMode

""""""""""""""" 屏蔽方向键
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
""""""""""""""" 屏蔽方向键

""""""""""""""" 输入法自动切换
"* 
"* Markdown文件进入插入模式时自动打开中文输入法
"* 所有文件退出插入模式时自动关闭中文输入法
"* 
if has('unix')
	autocmd! InsertLeave *	if system('fcitx-remote') != 0 | call system('fcitx-remote -c') | endif
	autocmd! InsertEnter *.md,COMMIT_EDITMSG	if system('fcitx-remote') != 0 | call system('fcitx-remote -o') | endif
endif
""""""""""""""" 输入法自动切换

""""""""""""""" UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/UltiSnips'
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
""""""""""""""" UltiSnips

""""""""""""""" 单行配置项
set listchars=tab:>-,trail:-,extends:#,nbsp:`
set encoding=utf-8                                                       " 支持UTF-8编码
let python_highlight_all=1                                               " 启用代码高亮
syntax on                                                                " 代码语言类型识别
set nu                                                                   " 显示行号
set mouse=a                                                              " 使用鼠标
set cursorline                                                           " 高亮当前行
set wildmenu                                                             " 显示补全列表
set wildmode=full                                                        " 显示所有补全项
set hlsearch                                                             " 高亮查找项
autocmd FileType python set omnifunc=pythoncomplete#Complete             " Python自动补全
nnoremap <Leader>u :GundoToggle<CR>                                      " 快速打开撤销树
let mapleader='\'                                                        " 设置Leader键
""""""""""""""" 单行配置项
