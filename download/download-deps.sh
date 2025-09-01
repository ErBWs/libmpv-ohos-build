#!/bin/bash

set -eu

. ./dep-versions.sh

cd $HOME/libmpv

# libass
[ ! -d libass ] && git clone --depth 1 -b $V_LIBASS https://github.com/libass/libass.git libass

# ffmpeg
[ ! -d ffmpeg ] && git clone --depth 1 -b $V_FFMPEG https://github.com/FFmpeg/FFmpeg.git ffmpeg

# mpv
[ ! -d mpv ]  && git clone --depth 1 -b $V_MPV https://github.com/mpv-player/mpv.git mpv
