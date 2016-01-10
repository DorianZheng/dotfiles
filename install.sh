############################################################
# initiation
############################################################
INSTALL_COMMAND="sudo apt-get install"
$INSTALL_COMMAND build-essential python-dev cmake git subversion vim vim-gnome dconf-cli \
  exuberant-ctags cscope unity-tweak-tool xclip

git submodule init
git submodule update


############################################################
# terminal
############################################################
ln -sf $HOME/dotfiles/terminal/gnome-terminal-colors-solarized $HOME/.solarized
ln -sf $HOME/dotfiles/terminal/dircolors-solarized/dircolors.ansi-dark $HOME/.dircolors

eval '$HOME/.solarized/set_dark.sh'


############################################################
# vim
############################################################
ln -sf $HOME/dotfiles/vim/vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/vim $HOME/.vim

vim +PluginInstall +qall

#eval '$HOME/.vim/bundle/YouCompleteMe/install.sh --clang-completer'


############################################################
# zsh
############################################################
ln -sf $HOME/dotfiles/zsh/oh-my-zsh $HOME/.oh-my-zsh
ln -sf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc

#chsh -s /bin/zsh


############################################################
# git
############################################################
ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

ssh-keygen -t rsa -b 4096 -C "xingzhengde72@gmail.com"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
