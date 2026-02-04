#!/bin/bash

set -eu

if [ "$(uname -s)" = "Linux" ]; then
  ./download/download-sdk.sh
  ln -s ./crossfiles/arm64-crossfile-linux.ini $ROOT_DIR/libmpv/arm64-crossfile.ini
elif [ "$(uname -s)" = "Darwin" ]; then
  ln -s ./crossfiles/arm64-crossfile-macos.ini $ROOT_DIR/libmpv/arm64-crossfile.ini
fi

./download/download-ohos-rs.sh
./download/download-deps.sh
