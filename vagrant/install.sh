#!/usr/bin/env bash
set -eu pipefail

version=2.0.1

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists vagrant

wget https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}_x86_64.deb -P /tmp
wget https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}_SHA256SUMS -P /tmp

cd /tmp
sha256sum --check --ignore-missing vagrant_${version}_SHA256SUMS \
  && sudo dpkg -i /tmp/vagrant_${version}_x86_64.deb

for plugin in "vagrant-lxc vagrant-hosts vagrant-triggers"; do
  vagrant plugin install ${plugin}
done
