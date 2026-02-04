#!/bin/bash

set -eu

ROOT_DIR=$(cd $(dirname "$0")/..; pwd)

. $ROOT_DIR/env.sh

pushd $ROOT_DIR/libmpv/fontconfig

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
  --cross-file $ROOT_DIR/libmpv/arm64-crossfile.ini \
  --prefix=$DEST \
  -Ddoc=disabled \
  -Dtests=disabled \
  -Dcache-build=disabled \
  -Dxml-backend=libxml2 \
  -Ddefault-fonts-dirs=/system/fonts
ninja -j$CORES
ninja install

popd