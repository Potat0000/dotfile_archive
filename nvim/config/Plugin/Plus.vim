" 增强版替换
call dein#add('tpope/vim-abolish', { 'on_cmd': 's' })


" 括号操作
call dein#add('tpope/vim-surround', { 'on_cmd': 's' })


" 根据=、:等对齐代码
call dein#add('junegunn/vim-easy-align', { 'on_cmd': 'ga' })

" 在Visual模式中或用区域操作符选中区域，然后使用 ga+<符号> 触发对齐
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" 显示与Git的增添
call dein#add('airblade/vim-gitgutter', { 'on_i': 1 })
