#!/usr/bin/env bash
set -eou pipefail

export USER=$(whoami)

function usage() {
  echo "usage: $0 [PACKAGE]"
  exit 0;
}

UPDATE=0

# environment
path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${path}/functions

while getopts ":hu" arg; do
  case ${arg} in
    h)
      usage
      ;;
    u)
      UPDATE=1
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      exit 1;
      ;;
  esac
done

shift $((OPTIND-1))

[[ $# -gt 1 ]] && usage

# install prerequisite packages
for package in "curl wget"; do
  hash curl &> /dev/null || sudo apt-get install -y ${package}
done

# install and configure packages
packages=${1:-$(cd ${path} && ls -d */ | tr -d '/')}
while read package; do
  install_script=${path}/${package}/install.sh
  [[ -x ${install_script} ]] || {
    echo "${install_script} does not exist or is not executable - skipping"
    continue
  }

  echo "++ Installing ${package}"
  UPDATE=${UPDATE} ${install_script}

  # link dot files
  ls ${path}/${package} | while read file; do
    target=${path}/${package}/${file}
    link_name=${HOME}/.${file}

    # ignore +x files as assumed to be install.sh
    if [ ! -x ${target} ]; then
      # if the dotfile exists but differs from the configuration file detailed
      # in the package, then remove and re-link
      [[ -e ${link_name} ]] && diff -q ${target} ${link_name} && {
        echo "${link_name} already in place... skipping"
        continue
      }

      # backup existing configuration and link dotfile
      [[ -e ${link_name} ]] && mv ${link_name} ${link_name}.bak
      ln -s ${target} ${link_name}
    fi
  done

done <<< "${packages}"

echo
echo "Done!"
