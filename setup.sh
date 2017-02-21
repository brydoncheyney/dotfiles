#!/usr/bin/env bash
set -eou pipefail

function usage() {
  echo "usage: $0 [PACKAGE]"
  exit 0;
}

[[ $# -gt 1 ]] && usage

# environment
path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${path}/functions

# install prerequisite packages
hash curl &> /dev/null || sudo apt install -y curl

# install and configure packages
packages=${1:-$(ls -d */ | tr -d '/')}
while read package; do
  [[ "prereqs" == "${package}" ]] && continue

  install_script=${path}/${package}/install.sh
  [[ -x ${install_script} ]] || {
    echo "${install_script} does not exist or is not executable - skipping"
    continue
  }

  echo "Installing ${package}"
  ${install_script}

  # TODO : link dotfiles | backup where required
done <<< "${packages}"

# clean up
sudo apt autoremove -y

echo
echo "Done!"
