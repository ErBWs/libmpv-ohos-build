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

../configure --prefix=$DEST/ffmpeg \
  --enable-ohcodec

make -j$CORES
make install

popd