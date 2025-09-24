#!/bin/bash

set -eu

pushd $HOME/libmpv/mbedtls

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

cmake -L \
  -DCMAKE_TOOLCHAIN_FILE=$OHOS_NDK_HOME/native/build/cmake/ohos.toolchain.cmake \
  -DCMAKE_INSTALL_PREFIX=$DEST/mbedtls
  -DCMAKE_SKIP_RPATH=TRUE \
  -DCMAKE_BUILD_TYPE=Release \
  ..
make -j$CORES no_test
make install

popd