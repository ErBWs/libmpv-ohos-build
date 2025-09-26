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
make DESTDIR=$DEST install

#cd ../pkgconfig
#cmake . -DCMAKE_INSTALL_PREFIX=$DEST \
#  -DCMAKE_INSTALL_INCLUDEDIR=include \
#  -DCMAKE_INSTALL_LIBDIR=lib
#make install

popd