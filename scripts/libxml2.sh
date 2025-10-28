#!/bin/bash

set -eu

pushd $HOME/libmpv/libxml2

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
  --cross-file $HOME/libmpv/arm64-crossfile.ini \
  --prefix=$DEST \
  -Ddocs=disabled \
  -Dzlib=enabled \
  -Dsax1=enabled
ninja -j$CORES
ninja install

popd