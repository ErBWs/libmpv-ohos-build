#!/bin/bash

set -eu

. ./dep-versions.sh

mkdir -p $HOME/libmpv/build

# Download OpenHarmony SDK
mkdir -p $HOME/libmpv/sdk
cd $HOME/libmpv/sdk
curl -fsSL https://repo.huaweicloud.com/openharmony/os/${V_SDK}/ohos-sdk-windows_linux-public.tar.gz
tar -zxvf ohos-sdk-windows_linux-public.tar.gz

# Extract NDK
cd ohos-sdk/linux
for i in *.zip
do
  unzip -q $i
done

# Export compile variables
export OHOS_SDK=$HOME/libmpv/sdk/ohos-sdk/linux
export OHOS_NDK_HOME=$HOME/libmpv/sdk/ohos-sdk/linux
export PATH=${OHOS_NDK_HOME}/native/build-tools/cmake/bin:$PATH
export AS=${OHOS_NDK_HOME}/native/llvm/bin/llvm-as
export CC=${OHOS_NDK_HOME}/native/llvm/bin/aarch64-unknown-linux-ohos-clang
export CXX=${OHOS_NDK_HOME}/native/llvm/bin/aarch64-unknown-linux-ohos-clang++
export LD=${OHOS_NDK_HOME}/native/llvm/bin/ld.lld
export STRIP=${OHOS_NDK_HOME}/native/llvm/bin/llvm-strip
export RANLIB=${OHOS_NDK_HOME}/native/llvm/bin/llvm-ranlib
export OBJDUMP=${OHOS_NDK_HOME}/native/llvm/bin/llvm-objdump
export OBJCOPY=${OHOS_NDK_HOME}/native/llvm/bin/llvm-objcopy
export NM=${OHOS_NDK_HOME}/native/llvm/bin/llvm-nm
export AR=${OHOS_NDK_HOME}/native/llvm/bin/llvm-ar
export CFLAGS='-fPIC -D__MUSL__=1'
export CXXFLAGS='-fPIC -D__MUSL__=1'
