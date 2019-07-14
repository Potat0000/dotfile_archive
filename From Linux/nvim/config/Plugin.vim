let s:dein_dir = expand('~/.nvim')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

call dein#begin(s:dein_dir)
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Plugin/Important.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Plugin/Useful.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Plugin/Plus.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Plugin/Improve_the_Coding_Experience.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Plugin/Language.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/Plugin/Other.vim'
call dein#end()
"call dein#save_state()

"* 
"* YouCompleteMe详细安装方法
"* 
"* 先在Vim中执行PlugInstall安装Plugin部分，然后执行以下命令：
"* sudo zypper in llvm-clang-devel python-devel cmake
"* python ~/.nvim/repos/github.com/Valloric/YouCompleteMe/install.py --clang-completer --system-libclang
"* sed -i s/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/\"\&/g ~/.nvim/repos/github.com/Valloric/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 使用BundleUpdate (或BundleInstall!) 升级Plugin前**可能**需要使用以下命令还原，因为有产生git冲突的风险。更新完成后使用上方sed命令重新打上补丁：
"* sed -i s/\"echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/g ~/.nvim/repos/github.com/Valloric/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 参考：https://petitming.github.io/%E6%8A%98%E9%A8%B0/2015/12/27/YCM/
"* 
