#!/usr/bin/env bash
set -eu pipefail

wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb -P /tmp
wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_SHA256SUMS -P /tmp

cd /tmp && sha256sum -c vagrant_1.9.1_SHA256SUMS | grep OK && sudo dpkg -i /tmp/vagrant_1.9.1_x86_64.deb

for plugin in "vagrant-lxc vagrant-hosts vagrant-triggers"; do
  vagrant plugin install ${plugin}
done
