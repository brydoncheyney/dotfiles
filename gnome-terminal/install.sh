#!/usr/bin/env bash
set -eou pipefail

# set default font and size
profile="/org/gnome/terminal/legacy/profiles:/"
UUID=$(dconf list ${profile})
echo dconf write "${profile}${UUID}font" "'Monospace 14'"
