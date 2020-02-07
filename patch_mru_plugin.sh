#!/bin/sh
set -e

cd sources_non_forked/mru.vim/plugin/
sed -i 's/botright/topleft/g' mru.vim
echo "Patched the MRU plugin."
