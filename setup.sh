#!/usr/bin/env bash
set -eou pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${path}/functions

# install prerequisite packages first
${path}/prereqs/install.sh

while read d; do
  ls "${path}/${d}install.sh"
  # TODO : link dotfiles
done <<< "$(ls -d */)"
