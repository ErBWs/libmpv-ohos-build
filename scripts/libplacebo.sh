#!/bin/bash

set -eu

pushd $HOME/libmpv/libplacebo

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
  -Ddovi=enabled \
  -Dlcms=enabled \
  -Dshaderc=enabled \
  -Dvulkan=enabled \
  -Dopengl=enabled \
  -Ddemos=false
ninja -j$CORES
ninja install

popd