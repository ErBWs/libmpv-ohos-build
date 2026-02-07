#!/bin/bash

set -eu

ROOT_DIR=$(cd $(dirname "$0")/..; pwd)

. $ROOT_DIR/env.sh

pushd $ROOT_DIR/libmpv/libxml2

if [ "$1" == "build" ]; then
	echo -e "\nBuilding libxml2..."
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
  -Ddocs=disabled \
  -Dzlib=enabled \
  -Dsax1=enabled
ninja -j$CORES
ninja install

popd