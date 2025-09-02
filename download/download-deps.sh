#!/bin/bash

set -eu

. ./dep-versions.sh

cd $HOME/libmpv

# ffmpeg
[ ! -d ffmpeg ] && git clone --depth 1 -b $V_FFMPEG https://github.com/FFmpeg/FFmpeg.git ffmpeg

# libass
[ ! -d libass ] && git clone --depth 1 -b $V_LIBASS https://github.com/libass/libass.git libass

# fftools_ffi
[ ! -d fftools_ffi ] && git clone -b main https://github.com/moffatman/fftools-ffi.git fftools_ffi && cd fftools_ffi && git reset --hard $V_FFTOOLS_FFI && cd ..

# mpv
[ ! -d mpv ]  && git clone --depth 1 -b $V_MPV https://github.com/mpv-player/mpv.git mpv
