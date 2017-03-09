#!/usr/bin/env bash
set -eu pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists vagrant

wget https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_x86_64.deb -P /tmp
wget https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_SHA256SUMS -P /tmp

cd /tmp
sha256sum --check --ignore-missing vagrant_1.9.2_SHA256SUMS \
  && sudo dpkg -i /tmp/vagrant_1.9.2_x86_64.deb

for plugin in "vagrant-lxc vagrant-hosts vagrant-triggers"; do
  vagrant plugin install ${plugin}
done
