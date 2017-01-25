#!/bin/sh

echo "Start installing config distro"

echo "We remove current config"

rm -rf ${HOME}/.emacs.d ${HOME}/.bashrc ${HOME}/.zshrc ${HOME}/.vimrc ${HOME}/.Xdefaults ${HOME}/.screenrc

echo "Setup links"
ln -s ${HOME}/.config/emacs.d ${HOME}/.emacs.d
ln -s ${HOME}/.config/commonconfigs/bashrc ${HOME}/.bashrc
ln -s ${HOME}/.config/commonconfigs/zshrc ${HOME}/.zshrc
ln -s ${HOME}/.config/commonconfigs/vimrc ${HOME}/.vimrc
ln -s ${HOME}/.config/commonconfigs/Xdefaults ${HOME}/.Xdefaults
ln -s ${HOME}/.config/commonconfigs/screenrc ${HOME}/.screenrc

echo "Installing complete"
