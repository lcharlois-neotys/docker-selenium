#!/usr/bin/env bash

# set -e: exit asap if a command exits with a non-zero status
# set -u: treat unset variables as an error and exit immediately
# set -x: print each command right before it is executed
set -eux

mkdir -p ./Chrome-deb && cd Chrome-deb
export CHROME_URL="https://dl.google.com/linux/direct"
wget -nv --show-progress -O Chrome_amd64.deb "${CHROME_URL}/google-Chrome-stable_current_amd64.deb"

set +e #do not fail from now on

wget -O stable_updates.html "http://googleChromereleases.blogspot.de/search/label/Stable%20updates"
VER=$(grep -Po '([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)' stable_updates.html | head -1)
NAME="google-Chrome-stable_${VER}_amd64"
mv Chrome_amd64.deb ${NAME}.deb

md5sum ${NAME}.deb > ${NAME}.md5
shasum ${NAME}.deb > ${NAME}.sha
