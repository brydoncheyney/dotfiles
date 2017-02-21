#!/usr/bin/env bash
set -eou pipefail

# setup environment
path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${path}/functions

# install prerequisite packages first
${path}/prereqs/install.sh

# install and configure packages
while read d; do
  [[ "prereqs/" == "${d}" ]] && continue

  echo "running ${d}install.sh"
  ${path}/${d}install.sh

  # TODO : link dotfiles | backup where required
done <<< "$(ls -d */)"

# clean up
sudo apt autoremove -y

echo
echo "Done!"
