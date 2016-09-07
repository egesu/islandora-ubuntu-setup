#!/bin/bash

source 001-environment.sh

# Please note some libraries, modules, contrib are optional but are included to support additional theming. e.g. features, strongarm, node_export

cd $OS_DEFAULT_DOCUMENTROOT

drush dl drupal

mv drupal-7* drupal7

cd drupal7

mkdir sites/default/files

mkdir sites/all/{modules,themes,libraries}

cp sites/default/default.settings.php sites/default/settings.php

cd sites/all/modules
