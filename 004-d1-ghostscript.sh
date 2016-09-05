#!/bin/bash

echo "Installing Ghostscript v9.05"
wget http://downloads.ghostscript.com/public/ghostscript-9.05.tar.gz
tar xvzf ghostscript-9.05.tar.gz
cd ghostscript-9.05
./configure
make && make install
should return result
gs --version
cd ..
