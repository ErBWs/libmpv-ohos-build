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
  --default-library shared \
  -Ddocs=disabled \
  -Dzlib=enabled \
  -Dsax1=enabled
ninja -j$CORES
ninja install

cd $DEST/lib
rm libxml2.so libxml2.so.[0-9][0-9]
mv libxml2.so* libxml2.so.16

popd