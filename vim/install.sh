#!/usr/bin/env bash
set -eou pipefail

sudo apt install -y vim

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

packages="ctrlpvim/ctrlp.vim ntpeters/vim-better-whitespace scrooloose/nerdtree tpope/vim-sensible tpope/vim-surround vim-airline/vim-airline"

cd ~/.vim/bundle
for package in ${packages}; do
  dest=$(echo ${package} | awk -F\/ '{print $2}')
  [[ ! -d ${dest} ]] && git clone https://github.com/${package}.git
  [[ -d ${dest} ]] && cd ${dest} && git pull --rebase; cd -
done
