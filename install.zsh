mkdir $ZSH_CUSTOM/themes
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/oh-my-zsh/agnoster-pyenv.zsh-theme $ZSH_CUSTOM/themes/agnoster-pyenv.zsh-theme
ln -s $PWD/oh-my-zsh/autosuggestions.zsh $ZSH_CUSTOM/autosuggestions.zsh

