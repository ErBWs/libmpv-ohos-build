#!/bin/bash

set -eu

# ffmpeg
./scripts/mbedtls.sh build
./scripts/dav1d.sh build
./scripts/ffmpeg.sh build

# libplacebo
./scripts/dovi_tools.sh build
./scripts/lcms.sh build
./scripts/shaderc.sh build
./scripts/libplacebo.sh build

# libass
./scripts/fribidi.sh build
./scripts/freetype.sh build
./scripts/harfbuzz.sh build
./scripts/libass.sh build

# mpv
./scripts/mpv.sh build
