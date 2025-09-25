#!/bin/bash

set -eu

. ./download/deps-version.sh

# Download OpenHarmony SDK
cd /
sudo curl -fsSL https://repo.huaweicloud.com/openharmony/os/${V_SDK}/ohos-sdk-windows_linux-public.tar.gz
sudo mkdir -p sdk
sudo tar -C sdk --strip-components=1 -zxf ohos-sdk-windows_linux-public.tar.gz
sudo rm ohos-sdk-windows_linux-public.tar.gz

# Extract NDK
cd sdk/linux
for i in *.zip
do
  sudo unzip -q $i
  sudo rm $i
done
