#!/bin/bash

source ../001.environment.sh

KDU_EXPAND_VERSION="$(kdu_expand -v)"
KDU_COMPRESS_VERSION="$(kdu_compress -v)"
CATALINA_HOME=/var/lib/tomcat7
TOMCAT_USER=tomcat7

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

cp /opt/adore-djatoka/dist/adore-djatoka.war $CATALINA_HOME/webapps
unzip -o /opt/adore-djatoka/dist/adore-djatoka.war -d $CATALINA_HOME/webapps/adore-djatoka

cd ~

git clone https://github.com/discoverygarden/islandora_log_config.git

cd islandora_log_config

cp islandora_logrotate /etc/logrotate.d/

# cp log4j.xml /usr/local/fedora/tomcat/webapps/fedoragsearch/WEB-INF/classes/log4j.xml

cp logging.properties /etc/tomcat7/logging.properties

cp log4j.properties $CATALINA_HOME/webapps/adore-djatoka/WEB-INF/classes/log4j.properties

cp setenv.sh.example /usr/share/tomcat7/bin/setenv.sh

chown -R $TOMCAT_USER:$TOMCAT_USER $CATALINA_HOME
