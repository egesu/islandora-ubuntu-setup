#!/bin/bash

source 001-environment.sh

echo "Installing Ghostscript v9.05"

if [ "$(gs --version)" != "9.05" ]; then
    if [ ! -d ghostscript-9.05 ]; then
        echo "Downloading ghostscript"
        wget http://downloads.ghostscript.com/public/old-gs-releases/ghostscript-9.05.tar.gz
        tar xvzf ghostscript-9.05.tar.gz
    else
        echo "Already downloaded ghostscript"
    fi

    cd ghostscript-9.05
    ./configure
    make && make install
else
    echo "Ghostscript is already installed"
fi

cd ..
