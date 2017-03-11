#!/usr/bin/env bash
set -eu pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

package python-pykickstart ksvalidator
