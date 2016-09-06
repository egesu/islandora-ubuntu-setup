#!/bin/bash

echo "export LC_CTYPE=en_US.UTF-8" >> ~/.bashrc
echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc

DB_SERVER="localhost"
DB_ROOT_PASSWORD="123456"              # Set MySQL root password -> keep it simple -> run mysql_secure_installation after install to secure mySQL
DRUPAL_DB_NAME="drupal7"               # Drupal database name
DRUPAL_DB_USER="drupal"                # Drupal username for settings.php file
DRUPAL_DB_PASS="password"              # Drupal password for settings.php file
DRUPAL_ADMIN_USER="admin"              # Drupal admin username to log into Drupal Site
DRUPAL_ADMIN_PASS="password"           # Drupal admin password to log into Drupal Site
DRUPAL_SITE_NAME="Islandora Install"   # Drupal site name - displayed on the web site
FEDORA_VERSION="3.8.1"                 # Fedora version to install:  3.5 or 3.6.2 or 3.7.0 or 3.7.1
FEDORA_DB_NAME="fedora3"               # Name of fedora MySQL database -> fedora3 is recommended
FEDORA_DB_USER="fedoraAdmin"           # Fedora db username -> for fedora.fcfg file
FEDORA_DB_PASS="password"              # Fedora db password -> for fedora.fcfg file
FEDORA_ADMIN_USER="fedoraAdmin"        # Username for http://localhost:8080/fedora/admin
FEDORA_ADMIN_PASS="password"           # Password for http://localhost:8080/fedora/admin
FEDORA_USER="fedora"                   # User that tomcat runs as
FEDORA_HOME="/usr/local/fedora"        # Fedora home dir
CATALINA_HOME="$FEDORA_HOME/tomcat"    # Tomcat location
# NOTE adjust memory so that it is no larger than half of total system memory. Depending on stack deployment this can be adjusted further. Don’t recommend running stack on system with less than 4GB of ram
JAVA_OPTS="-Xms512m -Xmx512m -XX:+CMSClassUnloadingEnabled -Djavax.net.ssl.trustStore=/usr/local/fedora/server/truststore -Djavax.net.ssl.trustStorePassword=tomcat -Dsolr.solr.home=/usr/local/fedora/solr -Dkakadu.home=/opt/adore-djatoka/bin/Linux-x86-64 -Djava.library.path=/opt/adore-djatoka/lib/Linux-x86-64 -DLD_LIBRARY_PATH=/opt/adore-djatoka/lib/Linux-x86-64"
JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre
# Moved this down below java install please change to match java version
TOMCAT_BASE="http://localhost:8080"
ISLANDORA_BASE="$TOMCAT_BASE/fedora"
SOLR_BASE="$TOMCAT_BASE/solr"
ISLANDORA_BRANCH="7.x"
TUQUE_BRANCH="1.x"
ERROR_LEVEL="2"
FEDORA_GSEARCH_URL="http://kent.dl.sourceforge.net/project/fedora-commons/services/3.7/fedoragsearch-2.8.zip"
FEDORA_GSEARCH_NAME="fedoragsearch-2.8"
SOLR_VERSION="4.2.1"
NUMBER_OF_GSEARCH_THREADS="2"          #do one gsearch thread per cpu might want to skip multithreading if you only have 1 cpu
GSEARCH_UPDATER_NAMES="FgsUpdaters FgsUpdater1"
DRUPAL_FILTER_URL="https://github.com/Islandora/islandora_drupal_filter/releases/download/v7.1.3/fcrepo-drupalauthfilter-3.8.1.jar"
SOLR_URL="http://archive.apache.org/dist/lucene/solr/4.2.1/solr-4.2.1.tgz"
SOLR_NAME="solr-4.2.1"
SOLR_DEFAULT_CORE_PATH="collection1"

Q1="CREATE DATABASE IF NOT EXISTS $DRUPAL_DB_NAME CHARACTER SET utf8 COLLATE utf8_bin;"
Q2="GRANT ALL ON $DRUPAL_DB_NAME.* TO $DRUPAL_DB_USER@localhost IDENTIFIED BY '$DRUPAL_DB_PASS';"
Q3="CREATE DATABASE IF NOT EXISTS $FEDORA_DB_NAME CHARACTER SET utf8 COLLATE utf8_bin;"
Q4="GRANT ALL ON $FEDORA_DB_NAME.* TO $FEDORA_DB_USER@localhost IDENTIFIED BY '$FEDORA_DB_PASS';"
Q5="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}${Q5}"

APACHE_DEFAULT_SITE="000-default"
APC_CONFIG_FILE="/etc/php5/mods-available/apcu.ini"
PROXY_DJATOKA_CONFIG="/etc/apache2/conf-available/proxy_djatoka.conf"
APACHE_USER="www-data"
APACHE_SERVICE="apache2"
OS_DEFAULT_DOCUMENTROOT="/var/www"
SCHEDULE_TOMCAT_SERVICE_COMMAND="update-rc.d tomcat start 95 2 3 4 5 . stop 15 0 1 6 ."
SCHEDULE_OPENOFFICE_SERVICE_COMMAND="update-rc.d openoffice start 92 2 3 4 5 . stop 30 0 1 6 ."
CRON_SPOOL_DIR="/var/spool/cron/crontabs"
MONIT_CONF_DIR="/etc/monit/conf.d"
MONIT_CONFIG_FILE="/etc/monit/monitrc"
