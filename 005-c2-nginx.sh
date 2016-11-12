#!/bin/bash

source 001-environment.sh

# Write our apache config to sites-available
cat nginx.conf > /etc/nginx/sites-available/islandora.conf
ln -T /etc/nginx/sites-available/islandora.conf /etc/nginx/sites-enabled/islandora.conf

pecl install uploadprogress

sed -i '949iextension=uploadprogress.so' /etc/php5/fpm/php.ini
sed -i "s|memory_limit = 128M|memory_limit = 512M|g" /etc/php5/fpm/php.ini
sed -i "s|post_max_size = 8M|post_max_size = 2048M|g" /etc/php5/fpm/php.ini
sed -i "s|upload_max_filesize = 2M|upload_max_filesize = 2048M|g" /etc/php5/fpm/php.ini

echo "apc.shm_size = 64M" >> $APC_CONFIG_FILE

service nginx restart
service php5-fpm restart
