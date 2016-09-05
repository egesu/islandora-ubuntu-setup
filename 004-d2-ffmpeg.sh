#!/bin/sh

# ffmpeg
mkdir ~/islandora-setup/ffmpeg-source
cd ~/islandora-setup/ffmpeg-source

# yasm
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz && rm -rf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure
make
checkinstall --pkgname=yasm --pkgversion="1.2.0" --backup=no --deldoc=yes --fstrans=no --default

# x264
cd ~/islandora-setup/ffmpeg-source
git clone --depth 1 git://git.videolan.org/x264.git
cd x264
./configure --enable-static --enable-shared
make
checkinstall --pkgname=x264 --pkgversion="3:$(./version.sh | awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes  --fstrans=no --default
ldconfig
cd ~/islandora-setup/ffmpeg-source

# aac
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure --disable-shared
make
checkinstall --pkgname=fdk-aac --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no --deldoc=yes --fstrans=no --default

# libvpx
cd ~/islandora-setup/ffmpeg-source
git clone https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
./configure --disable-examples --disable-unit-tests
make
checkinstall --pkgname=libvpx --pkgversion="1:$(date +%Y%m%d%H%M)-git" --backup=no --deldoc=yes --fstrans=no --default

# opus

cd ~/ffmpeg-source
git clone --depth 1 git://git.xiph.org/opus.git
cd opus
./autogen.sh
./configure --disable-shared
make
checkinstall --pkgname=libopus --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no --deldoc=yes --fstrans=no --default

# ffmpeg

cd ~/ffmpeg-source
wget http://www.ffmpeg.org/releases/ffmpeg-1.1.1.tar.gz
tar xf ffmpeg-1.1.1.tar.gz && rm -rf ffmpeg-1.1.1.tar.gz
cd ffmpeg-1.1.1

# had to do this to remove strange characters that cause build errors

sed -i 's/×/x/' doc/filters.texi
sed -i 's/×/x/' doc/ffmpeg.texi

./configure --enable-gpl --enable-libass --enable-libfaac --enable-libfdk-aac --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-librtmp --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree --enable-version3 --enable-libopus

make
checkinstall --pkgname=ffmpeg --pkgversion="7:$(date +%Y%m%d%H%M)-git" --backup=no --deldoc=yes --fstrans=no --default
make install
hash -r

# The following should tell apt to not upgrade ffmpeg - we need version 1.1.1

apt-mark hold ffmpeg

# Cleanup ffmpeg source code

ffmpeg -version && cd ~ && rm -rf ~/islandora-setup/ffmpeg-source
