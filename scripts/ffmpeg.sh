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
  --prefix=$DEST \
  --arch=aarch64 \
  --cpu=armv8-a \
  --target-os=linux \
  --enable-static \
  --disable-shared \
  --enable-version3 \
  --enable-pic \
  --disable-doc \
  --disable-programs \
  \
  --enable-cross-compile \
  --cc="$CC" \
  --extra-cflags="-I$DEST/include" \
  --extra-ldflags="-L$DEST/lib" \
  --enable-libdav1d \
  --enable-mbedtls \
  \
  --disable-devices \
  --disable-avdevice \
  --disable-muxers \
  --disable-encoders \
  --enable-ohcodec \
  --enable-encoder=png,mjpeg
make -j$CORES
make install

popd