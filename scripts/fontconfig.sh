#!/bin/bash

set -eu

pushd $HOME/libmpv/fontconfig

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
  -Ddoc=disabled \
  -Dtests=disabled \
  -Dcache-build=disabled \
  -Dxml-backend=libxml2 \
  -Ddefault-fonts-dirs=/system/fonts
ninja -j$CORES
ninja install

popd