#!/bin/bash

KDU_EXPAND_VERSION="$(kdu_expand -v)"
KDU_COMPRESS_VERSION="$(kdu_compress -v)"

if [[ "$KDU_EXPAND_VERSION" != *"v6.0" || "$KDU_COMPRESS_VERSION" != *"v6.0" ]]; then
    echo "Installing fits (kdu_compress, kdu_expand)"
    cd /opt
    wget http://fits.googlecode.com/files/fits-0.6.2.zip
    unzip -o fits-0.6.2.zip && rm -rf fits-0.6.2.zip && ln -s fits-0.6.2 fits && chmod a+x /opt/fits/fits.sh adore-djatoka
    cd /opt
    wget http://sourceforge.net/projects/djatoka/files/djatoka/1.1/adore-djatoka-1.1.tar.gz/download -O adore-djatoka-1.1.tar.gz
    tar xf adore-djatoka-1.1.tar.gz && rm -rf adore-djatoka-1.1.tar.gz
    ln -s adore-djatoka-1.1 adore-djatoka

    # Make kakadu available on the command line
    ln -s /opt/adore-djatoka/bin/Linux-x86-64/kdu_expand /usr/bin/kdu_expand
    ln -s /opt/adore-djatoka/bin/Linux-x86-64/kdu_compress /usr/bin/kdu_compress
    echo "/opt/adore-djatoka/lib/Linux-x86-64" > /etc/ld.so.conf.d/kakadu.conf
    ldconfig
else
    echo "Fits (kdu_compress, kdu_expand) already installed"
fi
