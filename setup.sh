#!/bin/bash

echo "Start installing config distro"

echo "We remove current config"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf ${HOME}/.emacs.d ${HOME}/.notion ${HOME}/.bashrc ${HOME}/.zshrc \
   ${HOME}/.vimrc ${HOME}/.Xdefaults ${HOME}/.screenrc \
   ${HOME}/.zprofile  ${HOME}/.brew

echo "Setup links"
ln -s ${DIR}/emacs.d ${HOME}/.emacs.d
ln -s ${DIR}/notion ${HOME}/.notion
ln -s ${DIR}/commonconfigs/bashrc ${HOME}/.bashrc
ln -s ${DIR}/commonconfigs/vimrc ${HOME}/.vimrc
ln -s ${DIR}/commonconfigs/zshrc ${HOME}/.zshrc
ln -s ${DIR}/commonconfigs/zprofile ${HOME}/.zprofile
ln -s ${DIR}/commonconfigs/Xdefaults ${HOME}/.Xdefaults
ln -s ${DIR}/commonconfigs/screenrc ${HOME}/.screenrc

# Setup brew
ln -s ${DIR}/linuxbrew ${HOME}/.brew

echo "Installing complete"
