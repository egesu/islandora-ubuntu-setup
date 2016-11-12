#!/bin/bash

source 001-environment.sh

chown -R $APACHE_USER:$APACHE_USER /var/www/drupal7

cd /var/www/drupal7

drush -y site-install standard --account-name=$DRUPAL_ADMIN_USER --account-pass=$DRUPAL_ADMIN_PASS --db-url=mysql://$DRUPAL_DB_USER:$DRUPAL_DB_PASS@$DB_SERVER/$DRUPAL_DB_NAME

# Secure settings.php
chmod 444 /var/www/drupal7/sites/default/settings.php
