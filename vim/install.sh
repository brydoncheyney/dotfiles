#!/usr/bin/env bash
set -eou pipefail

sudo apt-get install -y vim

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

packages=(altercation/vim-colors-solarized
          ctrlpvim/ctrlp.vim
          jistr/vim-nerdtree-tabs
          kien/rainbow_parentheses.vim
          ntpeters/vim-better-whitespace
          scrooloose/nerdtree
          tpope/vim-fugitive
          tpope/vim-sensible
          tpope/vim-surround
          vim-airline/vim-airline
          vim-scripts/paredit.vim
          vim-scripts/sudo.vim)

cd ~/.vim/bundle
for package in ${packages[*]}; do
  dest=$(echo ${package} | awk -F\/ '{print $2}')
  remote=https://github.com/${package}.git;
  [[ ! -d ${dest} ]] && { echo "Installing ${remote}"; git clone ${remote}; }
  [[ -d ${dest} ]] && {
    echo "Updating ${remote}"
    cd ${dest} && git pull --rebase
    cd - &> /dev/null
  }
done
