set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'     " Python自动缩进
Plugin 'SirVer/ultisnips'                 " 代码块
Plugin 'honza/vim-snippets'               " 代码块
Plugin 'altercation/vim-colors-solarized' " 配色方案
Plugin 'kien/ctrlp.vim'                   " Ctrl-P 超级搜索
Plugin 'scrooloose/nerdtree'              " 目录树
Plugin 'pbrisbin/vim-mkdir'               " 新建文件时自动创建不存在的文件夹
Plugin 'sjl/gundo.vim'                    " 撤销树
Plugin 'easymotion/vim-easymotion'        " 快速移动
Plugin 'plasticboy/vim-markdown'          " Markdown高亮
Plugin 'nathanaelkane/vim-indent-guides'  " 缩进指示器
Plugin 'tpope/vim-abolish'                " 增强版替换
Plugin 'tpope/vim-surround'               " 括号操作
Plugin 'rhysd/vim-clang-format'           " 自动格式化代码

"Plugin 'Chiel92/vim-autoformat'          " 自动格式化代码
"Plugin 'bronson/vim-trailing-whitespace' " 行尾空格高亮、快速去除
"Plugin 'nvie/vim-flake8'                 " PEP8代码风格检查，与YouCompleteMe功能重复
"Plugin 'klen/python-mode'                " Python插件，与YouCompleteMe功能重复
"Plugin 'ervandew/supertab'               " 拓展Tab键的功能，与YouCompleteMe冲突

Plugin 'Valloric/YouCompleteMe'           " 神级补全插件
"* 
"* 详细安装方法
"* 
"* 先在Vim中执行BundleInstall安装插件部分，然后执行以下命令：
"* sudo zypper in llvm-clang-devel python-devel cmake
"* bash ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang
"* sed -i s/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/\"\&/g ~/.vim/bundle/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 使用BundleUpdate (或BundleInstall!) 升级插件前**可能**需要使用以下命令还原，因为有产生git冲突的风险。更新完成后使用上方sed命令重新打上补丁：
"* sed -i s/\"echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/g ~/.vim/bundle/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 参考：https://petitming.github.io/%E6%8A%98%E9%A8%B0/2015/12/27/YCM/
"* 

call vundle#end()
filetype plugin indent on

"* 
"* 命令帮助
"* :BundleList       - 列出所有插件
"* :BundleInstall    - 安装插件，使用 :BundleInstall! 或 :BundleUpdate 升级插件
"* :BundleSearch foo - 查找插件foo，使用 :BundleSearch! 刷新本地缓存
"* :BundleClean      - 删除已安装但已经从vimrc中删除的插件，使用 :BundleClean! 跳过确认直接删除
"* 

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

""""""""""""""" SuperTab
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
""""""""""""""" SuperTab

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent
set fileformat=unix
""""""""""""""" 设置代码缩进、保存格式

""""""""""""""" 配色方案
set background=dark
colorscheme solarized
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

""""""""""""""" 自动格式化代码
noremap <F2> :ClangFormat<CR>
let g:clang_format#command = "clang-format"
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#auto_formatexpr = 1
let g:clang_format#style_options = {
    \ "AlignConsecutiveAssignments": "true",
    \ "AlignConsecutiveDeclarations": "true",
    \ "Cpp11BracedListStyle": "true",
    \ "MaxEmptyLinesToKeep": 3,
    \ "SpacesBeforeTrailingComments": 1,
    \ "PointerAlignment": "Right",
    \ "Standard": "Cpp11" }
""""""""""""""" 自动格式化代码

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
"let g:pymode_lint_todo_symbol = '⚠'
"let g:pymode_lint_comment_symbol = '☯'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = '✘'
"let g:pymode_lint_info_symbol = 'ⅰ'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"let g:pymode_options_max_line_length = 255
""""""""""""""" PyMode

""""""""""""""" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
""""""""""""""" Indent Guides

""""""""""""""" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.dotfile/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '⚠'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F3> :YcmForceCompileAndDiagnostics<CR>
inoremap <F3> <C-O>:YcmForceCompileAndDiagnostics<CR>
noremap <F4> :YcmDiags<CR>
let g:ycm_key_list_select_completion = ['<c-j>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-k>', '<c-p>', '<Up>']
""""""""""""""" YouCompleteMe

""""""""""""""" AutoCmd
"* 
"* Markdown文件进入插入模式时自动打开中文输入法
"* 所有文件退出插入模式时自动关闭中文输入法
"* Git Commit描述填写界面自动进入插入模式并切换为中文输入法
"* 
if has('unix')
	autocmd InsertLeave *	if system('fcitx-remote') != 0 | call system('fcitx-remote -c') | endif
	autocmd InsertEnter *.md,COMMIT_EDITMSG	if system('fcitx-remote') != 0 | call system('fcitx-remote -o') | endif
	autocmd VimEnter COMMIT_EDITMSG	startinsert
	autocmd CursorHold,CursorHoldI *.cpp,*.c,*.h,*.hpp,*.cc ClangFormat
endif
""""""""""""""" AutoCmd

""""""""""""""" UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
""""""""""""""" UltiSnips

""""""""""""""" 字数统计
"* 
"* 请提前运行 pip install zwc 进行安装
"* 出处：https://github.com/physacco/zwc
"* 
function! Zwc() range
  " send selected lines to system command *zwc* and print the output
  let select_beg_line = getpos("'<")[1]
  let select_end_line = getpos("'>")[1]
  let lines = getline(select_beg_line, select_end_line)
  let input = join(lines, "\n") . "\n"
  let output = system("zwc", input)
  echom substitute(output, '\v(^\_s+)|(\_s+$)', '', 'g')
endfunction
"vnoremap <F3> :call Zwc()<CR>
""""""""""""""" 字数统计

""""""""""""""" 防误操作
nnoremap ： :call system('fcitx-remote -c')<CR>:
command! Wq wq
command! Wqa wqa
""""""""""""""" 防误操作

""""""""""""""" 在符号两侧自动加入空格
"* 
"* 输入符号后在右边输入空格，左边也会添加空格
"* 增加符号请在下方[]中模仿添加
"* 暂未解决三个及以上符号连在一起的情况
"* 出处：http://forum.ubuntu.org.cn/viewtopic.php?t=394843
"* 

let g:space1 = ['+', '-', '*', '/', '%', '^', '=']
let g:space2 = [":=", "==", "!=", "<<", ">>", ">=", "<=", "+=", "-=", "/*=" ,"/=", "&&", "||"]

inoremap <space> <c-r>=SmartSpace()<CR>
function! SmartSpace()
    ""取上一行光标附近词a:char
    for key in g:space2
        echo key
    endfor
    let a:char = ''
    let a:prechar=' '
    let a:lastchar=''
    for key in range(-8, 6)
        let a:char = a:char.getline(line('.')-1)[col('.') + key]
    endfor
    ""判断a:char是否含有单个符号
    for key in g:space1
        if -1 != match(a:char, '\t'.key.' ')
            let a:prechar = '   '
            let a:lastchar = ' '
        elseif -1 != match(a:char, ' '.key.' ')
            let a:prechar = ' '
            let a:lastchar = ''
        endif
    endfor
    ""判断a:char是否含有两个连续符号
    for key in g:space2
        if -1 != match(a:char, '    '.key.' ') && 0 != match(a:char, '  '.key.' ')
            let a:prechar = '   '
            let a:lastchar = ' '
        elseif -1 != match(a:char, ' '.key)
            let a:prechar = ' '
            let a:lastchar = ' '
        endif
    endfor
    ""当前行两个连续符号
    let a:char = getline('.')[col('.')-3].getline('.')[col('.')-2]
    for key in g:space2
        if a:char == key
            if "[ \t]" !~ getline('.')[col('.')-4]
                return "\<left>\<left>".a:prechar."\<right>\<right> "
            else
                return " "
            endif
        endif
    endfor
    ""当前行一个符号
    let a:char = getline('.')[col('.')-2]
    for key in g:space1
        if a:char == key
            if "[ \t]" !~ getline('.')[col('.')-3]
                return "\<left>".a:prechar."\<right> ".a:lastchar
            elseif '    ' =~ getline('.')[col('.')-3]
                return "  "
            endif
        endif
    endfor
    return " "
endfunction
""""""""""""""" 在符号两侧自动加入空格

""""""""""""""" 用*查找选中的文本，用#执行方向查找
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
let @s = temp
endfunction
""""""""""""""" 用*查找选中的文本

""""""""""""""" 括号自动补全
"* 
"* 出处：https://gist.github.com/hotoo/449512
"* 
inoremap ( <c-r>=OpenPair('(')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=OpenPair('{')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=OpenPair('[')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
" just for xml document, but need not for now.
"inoremap < <c-r>=OpenPair('<')<CR>
"inoremap > <c-r>=ClosePair('>')<CR>
function! OpenPair(char)
    let PAIRs = {
                \ '{' : '}',
                \ '[' : ']',
                \ '(' : ')',
                \ '<' : '>'
                \}
    if line('$')>500
        let line = getline('.')

        let txt = strpart(line, col('.')-1)
    else
        let lines = getline(1,line('$'))
        let line=""
        for str in lines
            let line = line . str . "\n"
        endfor

        let blines = getline(line('.')-1, line("$"))
        let txt = strpart(getline("."), col('.')-1)
        for str in blines
            let txt = txt . str . "\n"
        endfor
    endif
    let oL = len(split(line, a:char, 1))-1
    let cL = len(split(line, PAIRs[a:char], 1))-1

    let ol = len(split(txt, a:char, 1))-1
    let cl = len(split(txt, PAIRs[a:char], 1))-1

    if oL>=cL || (oL<cL && ol>=cl)
        return a:char . PAIRs[a:char] . "\<Left>"
    else
        return a:char
    endif
endfunction
function! ClosePair(char)
    if getline('.')[col('.')-1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

inoremap ' <c-r>=CompleteQuote("'")<CR>
inoremap " <c-r>=CompleteQuote('"')<CR>
function! CompleteQuote(quote)
    let ql = len(split(getline('.'), a:quote, 1))-1
    let slen = len(split(strpart(getline("."), 0, col(".")-1), a:quote, 1))-1
    let elen = len(split(strpart(getline("."), col(".")-1), a:quote, 1))-1
    let isBefreQuote = getline('.')[col('.') - 1] == a:quote

    if '"'==a:quote && "vim"==&ft && 0==match(strpart(getline('.'), 0, col('.')-1), "^[\t ]*$")
        " for vim comment.
        return a:quote
    elseif "'"==a:quote && 0==match(getline('.')[col('.')-2], "[a-zA-Z0-9]")
        " for Name's Blog.
        return a:quote
    elseif (ql%2)==1
        " a:quote length is odd.
        return a:quote
    elseif ((slen%2)==1 && (elen%2)==1 && !isBefreQuote) || ((slen%2)==0 && (elen%2)==0)
        return a:quote . a:quote . "\<Left>"
    elseif isBefreQuote
        return "\<Right>"
    else
        return a:quote . a:quote . "\<Left>"
    endif
endfunction
""""""""""""""" 括号自动补全

""""""""""""""" 运行、编译、调试
noremap <F5> <Esc>:w<CR>:!clear && figlet " *   VIM    C++   *" && figlet " *   Compiler   *" && 
    \ echo "\n╭────────────────────────────────────────────────────────────╮" && 
    \ echo "│                     正在编译, 请稍后……                     │" && 
    \ echo "╰────────────────────────────────────────────────────────────╯\n" && 
    \ clang++ -std=c++1z -Weverything -Wno-c++98-compat % -o /tmp/vim_out.out && 
    \ echo "\n╭────────────────────────────────────────────────────────────╮" && 
    \ echo "│                         编译完成！                         │" && 
    \ echo "│                         正在启动……                         │" && 
    \ echo "╰────────────────────────────────────────────────────────────╯\n" && 
    \ echo "*↓*↓*↓*↓*↓*↓* 程序已启动，请在下方对程序进行测试 *↓*↓*↓*↓*↓*↓*" && 
    \ echo "──────────────────────────────────────────────────────────────" && 
    \ /tmp/vim_out.out && 
    \ echo "──────────────────────────────────────────────────────────────" && 
    \ echo "*↑*↑*↑* 程序已结束，如有必要，请对上方测试结果进行记录 *↑*↑*↑*" <CR>
noremap <F7> <Esc>:w<CR>:!clear && figlet " *   VIM    C++   *" && figlet " *   Compiler   *" && 
    \ echo "\n╭────────────────────────────────────────────────────────────╮" && 
    \ echo "│                     正在编译, 请稍后……                     │" && 
    \ echo "╰────────────────────────────────────────────────────────────╯\n" && 
    \ clang++ -std=c++1z -Weverything -Wno-c++98-compat % && 
    \ echo "╭────────────────────────────────────────────────────────────╮" && 
    \ echo "│                         编译完成！                         │" && 
    \ echo "│       编译输出文件位于当前文件所在目录, 文件名:a.out       │" && 
    \ echo "╰────────────────────────────────────────────────────────────╯"<CR>
noremap <C-F5> <Esc>:w<CR>:!clear && figlet " *   VIM    C++   *" && figlet " *   Compiler   *" && 
    \ echo "\n╭────────────────────────────────────────────────────────────╮" && 
    \ echo "│                     正在编译, 请稍后……                     │" && 
    \ echo "╰────────────────────────────────────────────────────────────╯\n" && 
    \ clang++ -std=c++1z -Weverything -Wno-c++98-compat -g % -o /tmp/vim_out.out && 
    \ echo "\n╭────────────────────────────────────────────────────────────╮" && 
    \ echo "│                         编译完成！                         │" && 
    \ echo "│                       正在启动gdb………                       │" && 
    \ echo "╰────────────────────────────────────────────────────────────╯\n" && 
    \ echo "*↓*↓*↓*↓* 调试程序(gdb)已启动,请在下方对程序进行调试 *↓*↓*↓*↓*" && 
    \ echo "──────────────────────────────────────────────────────────────" && 
    \ gdb /tmp/vim_out.out && 
    \ echo "──────────────────────────────────────────────────────────────" && 
    \ echo "*↑*↑*↑* 调试已结束，如有必要，请对上方调试结果进行记录 *↑*↑*↑*" <CR>
""""""""""""""" 运行、编译、调试   

""""""""""""""" 单行配置项
set listchars=tab:>-,trail:-,extends:#,nbsp:`
set encoding=utf-8                                                       " 支持UTF-8编码
let python_highlight_all=1                                               " 启用代码高亮
syntax on                                                                " 代码语言类型识别
set number                                                               " 显示行号
set mouse=a                                                              " 使用鼠标
set cursorline                                                           " 高亮当前行
set cursorcolumn                                                         " 高亮当前列
set wildmenu                                                             " 显示补全列表
set wildmode=full                                                        " 显示所有补全项
set hlsearch                                                             " 高亮查找项
set omnifunc=syntaxcomplete#Complete                                     " 自动补全
nnoremap <Leader>u :GundoToggle<CR>                                      " 快速打开撤销树
let mapleader='\'                                                        " 设置Leader键
set smartcase                                                            " 智能大小写忽略
set autoread                                                             " 自动重加载
set autowriteall                                                         " 在切换标签卡时自动保存
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>                        " 用Ctrl+L关闭查找高亮
set incsearch                                                            " 在执行查找前预览第一处匹配
map <leader><space> :FixWhitespace<cr>                                   " Trailing Whitespace的配置项，使用<leader><space>快速去除行尾空格
set updatetime=4000                                                      " (单位：ms) 超过指定时间后把交换文件写入磁盘，同时触发 CursorHold 自动命令事件
""""""""""""""" 单行配置项
