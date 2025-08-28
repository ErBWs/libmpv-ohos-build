# libmpv-ohos-build

https://gitcode.com/openharmony-sig/tpc_c_cplusplus/blob/master/lycium/doc/ohos_use_sdk/OHOS_SDK-Usage.md

```shell
sudo apt update

sudo apt install -y curl git vim gcc g++ make pkg-config autoconf automake patch libtool autopoint gperf \
    tcl8.6-dev wget unzip gccgo-go flex bison premake4 python3 python3-pip pipx sox gfortran \
    subversion build-essential module-assistant gcc-multilib g++-multilib libltdl7 cabextract \
    libboost-all-dev libxml2-utils gettext libxml-libxml-perl libxml2 libxml2-dev libxml-parser-perl \
    texinfo xmlto po4a libtool-bin yasm nasm xutils-dev libx11-dev xtrans-dev

存疑：ninja-build

pipx install meson

# ~/.bashrc
export OHOS_SDK=~/libmpv/sdk/ohos-sdk/linux
export PATH=${OHOS_SDK}/native/build-tools/cmake/bin:$PATH
export AS=${OHOS_SDK}/native/llvm/bin/llvm-as
export CC="${OHOS_SDK}/native/llvm/bin/clang --target=aarch64-linux-ohos"
export CXX="${OHOS_SDK}/native/llvm/bin/clang++ --target=aarch64-linux-ohos"
export LD=${OHOS_SDK}/native/llvm/bin/ld.lld
export STRIP=${OHOS_SDK}/native/llvm/bin/llvm-strip
export RANLIB=${OHOS_SDK}/native/llvm/bin/llvm-ranlib
export OBJDUMP=${OHOS_SDK}/native/llvm/bin/llvm-objdump
export OBJCOPY=${OHOS_SDK}/native/llvm/bin/llvm-objcopy
export NM=${OHOS_SDK}/native/llvm/bin/llvm-nm
export AR=${OHOS_SDK}/native/llvm/bin/llvm-ar
export CFLAGS="-fPIC -D__MUSL__=1"
export CXXFLAGS="-fPIC -D__MUSL__=1"
```
