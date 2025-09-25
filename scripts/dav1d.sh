#!/bin/bash

set -eu

pushd $HOME/libmpv/dav1d

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
  echo $(pwd)
	rm -rf .build
	exit 0
else
	exit 1
fi

mkdir -p .build
cd .build

meson setup .. \
  --cross-file $GITHUB_ACTION_PATH/crossfiles/arm64-crossfile.ini \
  --prefix=$DEST/dav1d \
  -Db_lto=true \
  -Denable_tests=false \
  -Denable_tools=false
ninja -j$CORES
ninja install

popd