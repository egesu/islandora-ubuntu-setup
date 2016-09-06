#!/bin/bash

source ../001.environment.sh

KDU_EXPAND_VERSION="$(kdu_expand -v)"
KDU_COMPRESS_VERSION="$(kdu_compress -v)"

echo "Installing djakota"
cd /opt
wget http://sourceforge.net/projects/djatoka/files/djatoka/1.1/adore-djatoka-1.1.tar.gz/download -O adore-djatoka-1.1.tar.gz
tar xf adore-djatoka-1.1.tar.gz && rm -rf adore-djatoka-1.1.tar.gz
ln -s adore-djatoka-1.1 adore-djatoka

# Make kakadu available on the command line
ln -s /opt/adore-djatoka/bin/Linux-x86-64/kdu_expand /usr/bin/kdu_expand
ln -s /opt/adore-djatoka/bin/Linux-x86-64/kdu_compress /usr/bin/kdu_compress
echo "/opt/adore-djatoka/lib/Linux-x86-64" > /etc/ld.so.conf.d/kakadu.conf
ldconfig

exit

cp /opt/adore-djatoka/dist/adore-djatoka.war $CATALINA_HOME/webapps && unzip -o /opt/adore-djatoka/dist/adore-djatoka.war -d $CATALINA_HOME/webapps/adore-djatoka

cd ~

git clone https://github.com/discoverygarden/islandora_log_config.git

cd islandora_log_config

cp islandora_logrotate /etc/logrotate.d/

cp log4j.xml /usr/local/fedora/tomcat/webapps/fedoragsearch/WEB-INF/classes/log4j.xml

cp logging.properties /usr/local/fedora/tomcat/conf/logging.properties

cp log4j.properties /usr/local/fedora/tomcat/webapps/adore-djatoka/WEB-INF/classes/log4j.properties

chown -R $FEDORA_USER:$FEDORA_USER $FEDORA_HOME
