#!/bin/bash

echo "Start installing config distro"

echo "We remove current config"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf ${HOME}/.emacs.d ${HOME}/.bashrc ${HOME}/.zshrc ${HOME}/.vimrc ${HOME}/.Xdefaults ${HOME}/.screenrc

echo "Setup links"
ln -s ${DIR}/emacs.d ${HOME}/.emacs.d
ln -s ${DIR}/commonconfigs/bashrc ${HOME}/.bashrc
ln -s ${DIR}/commonconfigs/zshrc ${HOME}/.zshrc
ln -s ${DIR}/commonconfigs/vimrc ${HOME}/.vimrc
ln -s ${DIR}/commonconfigs/Xdefaults ${HOME}/.Xdefaults
ln -s ${DIR}/commonconfigs/screenrc ${HOME}/.screenrc

echo "Installing complete"
