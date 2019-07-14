" 设置Leader键
let mapleader='\'

""""""""""""""" 分割区移动
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""""""""""""""" 分割区移动

""""""""""""""" 防误操作
nnoremap ： :call system('fcitx-remote -c')<CR>:
command! Wq wq
command! Wqa wqa
""""""""""""""" 防误操作

""""""""""""""" 内置终端（NeoVim 专用）
if has('nvim')
  nnoremap <silent> <Leader>: :below 10sp term://$SHELL<CR>A
  tnoremap <C-[> <C-\><C-n>
  tnoremap <ESC> <C-\><C-n>
  nnoremap t<Enter> :bo sp term://zsh\|resize 5<CR>i
endif
""""""""""""""" 内置终端（NeoVim 专用）

nnoremap <space> za     " 使用空格键折叠代码
vmap j gj
vmap k gk
nnoremap <Leader>u :GundoToggle<CR>                                      " 快速打开撤销树
nnoremap <silent> <CR> :nohlsearch<CR>                                   " 普通模式下用Enter关闭查找高亮
noremap <F12> :Goyo<CR>
