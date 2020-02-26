#!/usr/bin/env bash
set -eu pipefail

version=1.5.4

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

sudo apt-get install -y unzip
exists packer

wget -nc https://releases.hashicorp.com/packer/${version}/packer_${version}_linux_amd64.zip -P /tmp
wget -nc https://releases.hashicorp.com/packer/${version}/packer_${version}_SHA256SUMS -P /tmp

cd /tmp
sha256sum --check --ignore-missing packer_${version}_SHA256SUMS \
  && sudo unzip -fo -d /usr/local/bin/ /tmp/packer_${version}_linux_amd64.zip
