#!/usr/bin/env bash
set -eou pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists virtualbox

sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib' >> /etc/apt/sources.list"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y virtualbox-5.2
