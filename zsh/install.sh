#!/usr/bin/env bash
set -eou pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists zsh

sudo apt install -y zsh
chsh -s /bin/zsh

# oh-my-zsh
OHMYZSH=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh -c "$(curl -fsSL ${OHMYZSH})"
