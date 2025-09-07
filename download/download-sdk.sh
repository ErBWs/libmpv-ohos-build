#!/bin/bash

set -eu

. ./download/deps-version.sh

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
