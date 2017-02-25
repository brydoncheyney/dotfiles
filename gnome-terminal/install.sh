#!/usr/bin/env bash
set -eou pipefail

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
. ${path}/functions

hash xorg &> /dev/null || { echo "No X server installed... skipping"; exit 0; }

package dconf-cli dconf

# set default font and size
profile="/org/gnome/terminal/legacy/profiles:/"
UUID=$(dconf list ${profile})
dconf write "${profile}${UUID}font" "'Monospace 14'"
