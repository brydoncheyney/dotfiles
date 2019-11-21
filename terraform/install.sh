#!/usr/bin/env bash
set -eu pipefail

version=0.12.16

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

exists terraform

wget https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip -P /tmp
wget https://releases.hashicorp.com/terraform/${version}/terraform_${version}_SHA256SUMS -P /tmp

cd /tmp
sha256sum --check --ignore-missing terraform_${version}_SHA256SUMS \
  && sudo unzip -fo -d /usr/local/bin/ /tmp/terraform_${version}_linux_amd64.zip
