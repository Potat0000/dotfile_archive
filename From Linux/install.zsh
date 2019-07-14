sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir $ZSH_CUSTOM/themes
mkdir $HOME/.kde4/share/apps/konsole
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
ln -s $PWD/TomorrowNightEighties.colorscheme $HOME/.kde4/share/apps/konsole/TomorrowNightEighties.colorscheme
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/oh-my-zsh/agnoster-pyenv.zsh-theme $ZSH_CUSTOM/themes/agnoster-pyenv.zsh-theme
ln -s $PWD/oh-my-zsh/autosuggestions.zsh $ZSH_CUSTOM/autosuggestions.zsh
ln -s $PWD/UltiSnips ~/.vim/UltiSnips

# 安装YouCompleteMe
# 
# sudo zypper in llvm-clang-devel python-devel cmake
# bash ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang
# sed -i s/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/\"\&/g ~/.vim/bundle/YouCompleteMe/autoload/youcompleteme.vim
# 
# 使用BundleUpdate (或BundleInstall!) 升级插件前**可能**需要使用以下命令还原，因为有产生git冲突的风险。更新完成后使用上方sed命令重新打上补丁：
# sed -i s/\"echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/echom\ \"Forcing\ compilation,\ this\ will\ block\ Vim\ until\ done\.\"/g ~/.vim/bundle/YouCompleteMe/autoload/youcompleteme.vim
# 
# 参考：https://petitming.github.io/%E6%8A%98%E9%A8%B0/2015/12/27/YCM/
