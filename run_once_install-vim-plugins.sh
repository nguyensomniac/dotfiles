#!/bin/bash

# Clone Vundle if not present
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo "Installing Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
fi

# Install all Vim plugins
echo "Installing Vim plugins..."
vim +PluginInstall +qall
