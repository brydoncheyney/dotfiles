#!/usr/bin/env bash
set -eou pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists docker

sudo apt update

# install packages to allow apt to use a repo over https
sudo apt install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common

# add gpg key
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

# verify key
apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D

# add repository
sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"

# install docker
sudo apt update
sudo apt install -y docker-engine
