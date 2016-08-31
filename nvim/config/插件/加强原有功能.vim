" 增强版替换
Plug 'tpope/vim-abolish', { 'on': '<Plug>s' }


" 括号操作
Plug 'tpope/vim-surround', { 'on': '<Plug>s' }


" 根据=、:等对齐代码
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>ga' }

" 在Visual模式中或用区域操作符选中区域，然后使用 ga+<符号> 触发对齐
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" 显示与Git的增添
Plug 'airblade/vim-gitgutter'
