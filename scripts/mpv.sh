#!/bin/bash

set -eu

pushd $HOME/libmpv/mpv

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
  --prefix=$DEST/mpv \
  --default-library shared \
  --strip \
  -Dopensles=disabled \
  -Dohaudio=enabled \
  -Degl=enabled \
  -Dgpl=false \
  -Dbuild-date=false \
  -Dcplayer=false \
  -Dmanpage-build=disabled
ninja -j$CORES
ninja install

popd