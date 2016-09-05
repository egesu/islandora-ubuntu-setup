#!/bin/bash

source 001-environment.sh

cd ~/islandora-setup && wget http://v2v.cc/~j/ffmpeg2theora/ffmpeg2theora-0.29.linux64.bin && chmod a+x ffmpeg2theora-0.29.linux64.bin && install -m 755 ffmpeg2theora-0.29.linux64.bin /usr/bin/ffmpeg2theora && rm -rf ffmpeg2theora-0.29.linux64.bin
