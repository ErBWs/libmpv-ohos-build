#!/bin/bash

set -eu

pushd $HOME/libmpv/ffmpeg

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

../configure \
  --prefix=$DEST/ffmpeg \
  --arch=aarch64 \
  --cpu=armv8-a \
  --target-os=linux \
  --enable-static \
  --disable-shared \
  --enable-pic \
  --disable-doc \
  --disable-programs \
  \
  --enable-ohcodec \
  --enable-libdav1 \
  --enable-mbedtls \
  \
  --disable-muxers \
  --disable-encoders \
  --enable-encoders=png,mjpeg \

make -j$CORES
make install

popd