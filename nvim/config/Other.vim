""""""""""""""" 永久撤销记录
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
""""""""""""""" 永久撤销记录

""""""""""""""" 设置代码缩进、保存
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent
set fileformat=unix
""""""""""""""" 设置代码缩进、保存格式

""""""""""""""" NeoVim 专用选项
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1                                    " 允许真彩显示
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1                                  " 允许光标变化
endif
""""""""""""""" NeoVim 专用选项

""""""""""""""" 单行配置项
set foldmethod=syntax                                                    " 启用基于语法的代码折叠
set foldlevelstart=99                                                    " 99层以上的代码自动折叠（即不自动折叠代码，因为达不到99层）
syntax on                                                                " 代码语言类型识别
set number                                                               " 显示行号
set relativenumber                                                       " 显示相对行号
set cursorline                                                           " 高亮当前行
set cursorcolumn                                                         " 高亮当前列
set wildmode=full                                                        " 显示所有补全项
set omnifunc=syntaxcomplete#Complete                                     " 自动补全
set smartcase                                                            " 智能大小写忽略
set autowriteall                                                         " 在切换标签卡时自动保存
set updatetime=4000                                                      " (单位：ms) 超过指定时间后把交换文件写入磁盘，同时触发 CursorHold 自动命令事件
set splitright                                                           " 在右边打开新的窗口（垂直分割）
set splitbelow                                                           " 在下边打开新的窗口（水平分割）
set noshowmode                                                           " 模式切换（在状态栏左下方）
set showcmd                                                              " 按键提示（在状态栏右下方）
set sidescroll=1 sidescrolloff=3                                         " 让水平滚动更加自然
""""""""""""""" 单行配置项
