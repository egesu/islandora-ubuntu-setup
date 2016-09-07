#!/bin/bash

source 001-environment.sh

cd /var/www/drupal7/sites/all/libraries/

git clone -b $TUQUE_BRANCH git://github.com/Islandora/tuque.git

git clone https://github.com/Islandora/internet_archive_bookreader.git bookreader

wget https://github.com/openseadragon/openseadragon/releases/download/v1.1.1/openseadragon-bin-1.1.1.tar.gz -O openseadragon-bin-1.1.1.tar.gz && tar xf openseadragon-bin-1.1.1.tar.gz && rm -rf openseadragon-bin-1.1.1.tar.gz && mv openseadragon-bin-1.1.1 openseadragon

wget https://videos.cdn.mozilla.net/uploads/air_mozilla/players/jwplayer6/jwplayer-3359.zip && unzip -o jwplayer-3359.zip && rm -rf jwplayer-3359.zip

wget https://github.com/moxiecode/plupload/archive/v1.5.8.zip -O v1.5.8.zip && unzip -o v1.5.8.zip && rm -rf v1.5.8.zip && mv plupload-1.5.8 plupload

wget http://sourceforge.net/projects/jodconverter/files/JODConverter/2.2.2/jodconverter-2.2.2.zip/download -O jodconverter-2.2.2.zip && unzip -o jodconverter-2.2.2.zip && rm -rf jodconverter-2.2.2.zip

mkdir jquery.cycle && cd jquery.cycle && wget http://malsup.github.com/jquery.cycle.all.js

drush dl imagemagick libraries views ctools oauth chart google_analytics views_slideshow views_responsive_grid strongarm features designkit conditional_styles socialmedia widgets features_extra uuid node_export block_class ldap entity colorbox rules xmlsitemap css_injector
