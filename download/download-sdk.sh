#!/bin/bash

set -eu

. ./dep-versions.sh

mkdir -p $HOME/libmpv/sdk
cd $HOME/libmpv/sdk

curl -fsSL https://repo.huaweicloud.com/openharmony/os/${V_MPV}/ohos-sdk-windows_linux-public.tar.gz

tar -zxvf ohos-sdk-windows_linux-public.tar.gz
cd ohos-sdk/linux
unzip native*.zip

# Export variables according to:
# https://gitcode.com/openharmony-sig/tpc_c_cplusplus/blob/master/lycium/doc/ohos_use_sdk/OHOS_SDK-Usage.md
export OHOS_SDK=$HOME/libmpv/sdk/ohos-sdk/linux
export PATH=${OHOS_SDK}/native/build-tools/cmake/bin:$PATH
export AS=${OHOS_SDK}/native/llvm/bin/llvm-as
export CC='${OHOS_SDK}/native/llvm/bin/clang --target=aarch64-linux-ohos'
export CXX='${OHOS_SDK}/native/llvm/bin/clang++ --target=aarch64-linux-ohos'
export LD=${OHOS_SDK}/native/llvm/bin/ld.lld
export STRIP=${OHOS_SDK}/native/llvm/bin/llvm-strip
export RANLIB=${OHOS_SDK}/native/llvm/bin/llvm-ranlib
export OBJDUMP=${OHOS_SDK}/native/llvm/bin/llvm-objdump
export OBJCOPY=${OHOS_SDK}/native/llvm/bin/llvm-objcopy
export NM=${OHOS_SDK}/native/llvm/bin/llvm-nm
export AR=${OHOS_SDK}/native/llvm/bin/llvm-ar
export CFLAGS='-fPIC -D__MUSL__=1'
export CXXFLAGS='-fPIC -D__MUSL__=1'
