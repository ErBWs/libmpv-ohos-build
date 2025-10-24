#!/bin/bash

set -eu

pushd $HOME/libmpv/libass

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

# to enable fontconfig, remove --disable-require-system-font-provider
../configure \
  --prefix=$DEST \
  --host=aarch64-linux \
  --with-pic \
  --enable-static \
  --disable-shared \
  --disable-require-system-font-provider
make -j$CORES
make install

popd