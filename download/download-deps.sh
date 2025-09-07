#!/bin/bash

set -eu

. ./download/deps-version.sh

cd $HOME/libmpv

# mbedtls
[ ! -d mbedtls ] && git clone --depth 1 -b $V_MBEDTLS https://github.com/Mbed-TLS/mbedtls.git mbedtls

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

# dovi_tools
[ ! -d dovi_tools ] && git clone --depth 1 -b $V_DOVI_TOOLS https://github.com/quietvoid/dovi_tool.git dovi_tools

# ffmpeg
[ ! -d ffmpeg ] && git clone --depth 1 -b $V_FFMPEG https://github.com/FFmpeg/FFmpeg.git ffmpeg

# libass
[ ! -d libass ] && git clone --depth 1 -b $V_LIBASS https://github.com/libass/libass.git libass

# libplacebo
[ ! -d libplacebo ] && git clone --depth 1 -b $V_LIBPLACEBO --recursive https://code.videolan.org/videolan/libplacebo.git libplacebo

# uchardet
[ ! -d uchardet ] && git clone --depth 1 -b $V_UCHARDET https://gitlab.freedesktop.org/uchardet/uchardet.git uchardet

# mpv
[ ! -d mpv ]  && git clone --depth 1 -b $V_MPV https://github.com/mpv-player/mpv.git mpv
