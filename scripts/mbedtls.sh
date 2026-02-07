#!/bin/bash

set -eu

ROOT_DIR=$(cd $(dirname "$0")/..; pwd)

. $ROOT_DIR/env.sh

pushd $ROOT_DIR/libmpv/mbedtls

if [ "$1" == "build" ]; then
	echo -e "\nBuilding mbedtls..."
elif [ "$1" == "clean" ]; then
	make clean
	exit 0
else
	exit 1
fi

python3 -m venv .venv
source .venv/bin/activate
pip install -r scripts/basic.requirements.txt

make -j$CORES no_test
make DESTDIR=$DEST install

popd