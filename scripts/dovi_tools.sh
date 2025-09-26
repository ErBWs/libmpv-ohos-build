#!/bin/bash

set -eu

pushd $HOME/libmpv/dovi_tools/dolby_vision

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	cargo clean
	exit 0
else
	exit 1
fi

cargo cinstall \
  --release \
  --target=aarch64-unknown-linux-ohos \
  --library-type=staticlib \
  --prefix=$DEST \
  --libdir=lib

popd
