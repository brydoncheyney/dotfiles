#!/usr/bin/env bash
set -eu pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists ansible

sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get -y update
sudo apt-get -y install ansible
