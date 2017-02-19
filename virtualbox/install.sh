#!/usr/bin/env bash
set -eou pipefail

sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian yakkety contrib' >> /etc/apt/sources.list"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt update
sudo apt install -y virtualbox-5.1
