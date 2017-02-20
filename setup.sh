#!/usr/bin/env bash
set -eou pipefail

# install prerequisite packages first
./prereqs/install.sh

while read d; do
  ls "./${d}install.sh"
  # TODO : link dotfiles
done <<< "$(ls -d */)"
