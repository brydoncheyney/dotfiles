#!/usr/bin/env bash
set -eou pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

package openjdk-8-jdk java
