#!/usr/bin/env bash
set -eu pipefail

version=6.11.3
binary=node-v${version}-linux-x64.tar.xz
binary_link=https://nodejs.org/dist/v${version}/${binary}
shasums=SHASUMS256.txt.asc
shasums_link=https://nodejs.org/dist/v${version}/${shasums}

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists node

wget -r -nd ${binary_link} -P /tmp
wget -r -nd ${shasums_link} -P /tmp

(
cd /tmp
sha256sum --check --ignore-missing ${shasums} \
  && { xzcat ${binary} | sudo tar -C/usr/local -xf -; \
       sudo ln -fs /usr/local/$(basename ${binary} .tar.xz) /usr/local/node;
  }
)
