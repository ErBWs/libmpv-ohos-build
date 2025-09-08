#!/bin/bash

set -eu

pushd $HOME/libmpv/dovi_tools

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	rm -rf .build
	exit 0
else
	exit 1
fi

ohrs build --release --static --dest .build --arch aarch

popd
