#!/usr/bin/env bash
set -eou pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

package python-pip
package python-dev

exists thefuck

sudo pip -H install psutil thefuck
