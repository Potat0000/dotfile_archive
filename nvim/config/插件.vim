call plug#begin('~/.dot/nvim/plugged')
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/插件/必须使用的及对配色的支持.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/插件/实用功能.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/插件/加强原有功能.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/插件/提升Coding体验.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/插件/语言扩展.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/插件/其他.vim'
call plug#end()

"* 
"* YouCompleteMe详细安装方法
"* 
"* 先在Vim中执行PlugInstall安装插件部分，然后执行以下命令：
"* sudo zypper in llvm-clang-devel python-devel cmake
"* bash ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang
"* sed -i s/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/\"\&/g ~/.vim/bundle/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 使用BundleUpdate (或BundleInstall!) 升级插件前**可能**需要使用以下命令还原，因为有产生git冲突的风险。更新完成后使用上方sed命令重新打上补丁：
"* sed -i s/\"echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/g ~/.vim/bundle/YouCompleteMe/autoload/youcompleteme.vim
"* 
"* 参考：https://petitming.github.io/%E6%8A%98%E9%A8%B0/2015/12/27/YCM/
"* 
