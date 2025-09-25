#!/bin/bash

set -eu

pushd $HOME/libmpv/mbedtls

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	make clean
	exit 0
else
	exit 1
fi

make -j$CORES no_test
make DESTDIR=$DEST/mbedtls install

popd