#!/bin/bash

set -eu

# ffmpeg
./scripts/mbedtls.sh build
./scripts/dav1d.sh build
./scripts/ffmpeg.sh build

# fontconfig
./scripts/libxml2.sh build

# libass
./scripts/fribidi.sh build
./scripts/freetype.sh build
./scripts/harfbuzz.sh build
./scripts/fontconfig.sh build
./scripts/libass.sh build

# libplacebo
./scripts/lcms.sh build
./scripts/shaderc.sh build
./scripts/libplacebo.sh build

# mpv
./scripts/mpv.sh build
