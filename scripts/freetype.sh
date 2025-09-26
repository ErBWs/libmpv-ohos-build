#!/bin/bash

set -eu

pushd $HOME/libmpv/freetype

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	rm -rf .build
	exit 0
else
	exit 1
fi

mkdir -p .build
cd .build

meson setup .. \
  --cross-file $GITHUB_ACTION_PATH/crossfiles/arm64-crossfile.ini \
  --prefix=$DEST
ninja -j$CORES
ninja install

popd