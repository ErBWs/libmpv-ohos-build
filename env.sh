#!/bin/bash

set -eu

ROOT_DIR=$(cd $(dirname "$0")/..; pwd)

if [ "$(uname -s)" = "Linux" ]; then
  export OHOS_NDK_HOME=/sdk/linux
  export CORES=$(nproc)
elif [ "$(uname -s)" = "Darwin" ]; then
  export OHOS_NDK_HOME=/Applications/DevEco-Studio.app/Contents/sdk/default/openharmony
  export CORES=$(sysctl -n hw.ncpu)
fi

export DEST=$ROOT_DIR/libmpv/arm64-build
export PATH=$OHOS_NDK_HOME/native/build-tools/cmake/bin:$PATH
export PKG_CONFIG_PATH=$DEST/lib/pkgconfig
export PKG_CONFIG_LIBDIR=$OHOS_NDK_HOME/native/sysroot/usr/lib
export PKG_CONFIG_INCLUDEDIR=$OHOS_NDK_HOME/native/sysroot/usr/include

export AS=$OHOS_NDK_HOME/native/llvm/bin/llvm-as
export CC="$OHOS_NDK_HOME/native/llvm/bin/clang --target=aarch64-linux-ohos --sysroot=$OHOS_NDK_HOME/native/sysroot"
export CXX="$OHOS_NDK_HOME/native/llvm/bin/clang++ --target=aarch64-linux-ohos --sysroot=$OHOS_NDK_HOME/native/sysroot"
export LD=$OHOS_NDK_HOME/native/llvm/bin/ld.lld
export STRIP=$OHOS_NDK_HOME/native/llvm/bin/llvm-strip
export RANLIB=$OHOS_NDK_HOME/native/llvm/bin/llvm-ranlib
export OBJDUMP=$OHOS_NDK_HOME/native/llvm/bin/llvm-objdump
export OBJCOPY=$OHOS_NDK_HOME/native/llvm/bin/llvm-objcopy
export NM=$OHOS_NDK_HOME/native/llvm/bin/llvm-nm
export AR=$OHOS_NDK_HOME/native/llvm/bin/llvm-ar
export CFLAGS='-fPIC -D__MUSL__=1'
export CXXFLAGS='-fPIC -D__MUSL__=1'
