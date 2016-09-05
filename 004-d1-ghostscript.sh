#!/bin/bash

echo "Installing Ghostscript v9.05"

if [ ! -d ghostscript-9.05 ]; then
    echo "Downloading ghostscript"
    wget http://downloads.ghostscript.com/public/old-gs-releases/ghostscript-9.05.tar.gz
    tar xvzf ghostscript-9.05.tar.gz
fi

cd ghostscript-9.05
./configure
make && make install
should return result
gs --version
cd ..
