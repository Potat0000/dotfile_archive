mkdir $ZSH_CUSTOM/themes
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/agnoster-pyenv.zsh-theme $ZSH_CUSTOM/themes/agnoster-pyenv.zsh-theme
ln -s $PWD/autosuggestions.zsh $ZSH_CUSTOM/autosuggestions.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
