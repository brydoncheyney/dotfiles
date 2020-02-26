#!/usr/bin/env bash
set -eu pipefail

version=1.14

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists go

installed_version=$(go version $(which go) | awk '{print $2}')

[ "${installed_version}" == "go${version}" ] && {
  echo "++ Already on latest version"
  exit
}

curl -s https://dl.google.com/go/go${version}.linux-amd64.tar.gz | gzip -dc - | sudo tar xf - -C /usr/local
