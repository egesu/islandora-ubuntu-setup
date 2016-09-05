#!/bin/bash

# Specify drush commit due to issues with newer drush versions and automated tests used by QA
cd /opt
git clone https://github.com/drush-ops/drush.git && cd drush && git checkout b9e6c8c00da0fbf1227869cdf915b0c6cea466cc
ln -s /opt/drush/drush /usr/bin/drush
