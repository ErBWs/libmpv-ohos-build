#!/bin/bash

set -eu

ROOT_DIR=$(cd $(dirname "$0")/..; pwd)

. $ROOT_DIR/download/deps-version.sh

mkdir -p $ROOT_DIR/libmpv/arm64-build

pushd $ROOT_DIR/libmpv

# mbedtls
if [ ! -d mbedtls ]; then
	mkdir mbedtls
	curl -fsSL https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$V_MBEDTLS/mbedtls-$V_MBEDTLS.tar.bz2 > mbedtls.tar.bz2
  tar -C mbedtls --strip-components=1 -jxf mbedtls.tar.bz2
  rm mbedtls.tar.bz2
fi

# dav1d
[ ! -d dav1d ] && git clone --depth 1 -b $V_DAV1D https://code.videolan.org/videolan/dav1d.git dav1d

# libxml2
[ ! -d libxml2 ] && git clone --depth 1 -b $V_LIBXML2 --recursive https://gitlab.gnome.org/GNOME/libxml2.git libxml2

# fribidi
[ ! -d fribidi ] && git clone --depth 1 -b $V_FRIBIDI https://github.com/fribidi/fribidi.git fribidi

# freetype
[ ! -d freetype ] && git clone --depth 1 -b $V_FREETYPE https://gitlab.freedesktop.org/freetype/freetype.git freetype

# harfbuzz
[ ! -d harfbuzz ] && git clone --depth 1 -b $V_HARFBUZZ https://github.com/harfbuzz/harfbuzz.git harfbuzz

# fontconfig
[ ! -d fontconfig ] && git clone --depth 1 -b $V_FONTCONFIG https://gitlab.freedesktop.org/fontconfig/fontconfig.git fontconfig

# dovi_tools
[ ! -d dovi_tools ] && git clone --depth 1 -b $V_DOVI_TOOLS https://github.com/quietvoid/dovi_tool.git dovi_tools

# lcms
[ ! -d lcms ] && git clone --depth 1 -b $V_LCMS https://github.com/mm2/Little-CMS.git lcms

# shaderc
if [ ! -d shaderc ]; then
  git clone --depth 1 -b $V_SHADERC https://github.com/google/shaderc.git shaderc
  cd shaderc
  ./utils/git-sync-deps
  cd ..
fi

# ffmpeg
[ ! -d ffmpeg ] && git clone --depth 1 -b $V_FFMPEG https://github.com/FFmpeg/FFmpeg.git ffmpeg

# libass
[ ! -d libass ] && git clone --depth 1 -b $V_LIBASS https://github.com/libass/libass.git libass

# libplacebo
[ ! -d libplacebo ] && git clone --depth 1 -b $V_LIBPLACEBO --recursive https://code.videolan.org/videolan/libplacebo.git libplacebo

# lua
if [ ! -d lua ]; then
	mkdir lua
	curl -fsSL https://www.lua.org/ftp/lua-$V_LUA.tar.gz > lua.tar.gz
  tar -C lua --strip-components=1 -zxf lua.tar.gz
  rm lua.tar.gz
fi

# mpv
[ ! -d mpv ]  && git clone --depth 1 -b $V_MPV https://github.com/ErBWs/mpv.git mpv

popd
