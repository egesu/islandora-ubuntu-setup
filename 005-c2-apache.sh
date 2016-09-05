#!/bin/bash

source 001-environment.sh

# Write our apache config to sites-available
cat apache.conf > /etc/apache2/sites-available/000-default.conf

a2enmod rewrite
a2enmod proxy
a2enmod proxy_http

pecl install uploadprogress

sed -i '949iextension=uploadprogress.so' /etc/php5/apache2/php.ini
sed -i "s|memory_limit = 128M|memory_limit = 512M|g" /etc/php5/apache2/php.ini
sed -i "s|post_max_size = 8M|post_max_size = 2048M|g" /etc/php5/apache2/php.ini
sed -i "s|upload_max_filesize = 2M|upload_max_filesize = 2048M|g" /etc/php5/apache2/php.ini

echo "apc.shm_size = 64M" >> $APC_CONFIG_FILE
