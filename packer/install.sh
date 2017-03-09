#!/usr/bin/env bash
set -eu pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists packer

wget -nc https://releases.hashicorp.com/packer/0.12.3/packer_0.12.3_linux_amd64.zip -P /tmp
wget -nc https://releases.hashicorp.com/packer/0.12.3/packer_0.12.3_SHA256SUMS -P /tmp

cd /tmp
sha256sum --check --ignore-missing packer_0.12.3_SHA256SUMS \
  && sudo unzip -d /usr/local/bin/ /tmp/packer_0.12.3_linux_amd64.zip
