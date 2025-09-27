#!/bin/bash

set -eu

. ./download/deps-version.sh

# Download OpenHarmony SDK
cd /
#sudo curl -fsSL https://repo.huaweicloud.com/openharmony/os/$V_SDK/ohos-sdk-windows_linux-public.tar.gz -o sdk.tar.gz
sudo mkdir -p sdk
sudo tar -C sdk -zxf sdk.tar.gz
sudo rm sdk.tar.gz

cd sdk
sudo rm -rf windows/

# Extract NDK
cd linux
for i in *.zip
do
  sudo unzip -q $i
  sudo rm $i
done
