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

[ ! -f configure ] && ./autogen.sh

mkdir -p .build
cd .build

CFLAGS="-Wno-int-conversion" ../configure \
  --prefix=$DEST \
  --host=aarch64-linux \
  --with-pic \
  --enable-static \
  --disable-shared \
  --enable-libxml2 \
  --disable-docs \
  --with-default-fonts=/system/fonts \
  --disable-cache-build \
  --enable-silent-rules
make -j$CORES
make install

popd