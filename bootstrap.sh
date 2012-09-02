#!/bin/sh
cp -r ~/.vim ~/.vim.old 2>/dev/null
rm -fr ~/.vim 2>/dev/null
cp ~/.vimrc ~/.vimrc_backup 2>/dev/null
rm -f ~/.vimrc 2>/dev/null
git clone https://github.com/ajy/vimfiles ~/.vim && cd ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc
# for getting vundle
git submodule init && git submodule update
#for tagbar
sudo apt-get install exuberant-ctags
# now install plugins into vim
vim +BundleInstall +q +q
