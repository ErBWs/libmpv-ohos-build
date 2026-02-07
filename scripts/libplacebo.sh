#!/bin/bash

set -eu

ROOT_DIR=$(cd $(dirname "$0")/..; pwd)

. $ROOT_DIR/env.sh

pushd $ROOT_DIR/libmpv/libplacebo

if [ "$1" == "build" ]; then
	echo -e "\nBuilding libplacebo..."
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
  -Ddovi=enabled \
  -Dlcms=enabled \
  -Dshaderc=enabled \
  -Dvulkan=enabled \
  -Dopengl=enabled \
  -Ddemos=false
ninja -j$CORES
ninja install

popd