#!/bin/bash

set -eu

# download required deps
./download/download-sdk.sh
./download/download-ohos-rs.sh
./download/download-deps.sh
./download/post-download.sh
