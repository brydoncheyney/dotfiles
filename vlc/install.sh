#!/usr/bin/env bash
set -eu pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists vlc

sudo apt-add-repository ppa:videolan/stable-daily
sudo apt-get -y update
sudo apt-get -y install vlc browser-plugin-vlc
