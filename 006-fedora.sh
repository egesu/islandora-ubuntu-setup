#!/bin/bash

source 001-environment.sh

cd ~/islandora-setup

echo -e 'keystore.file=included\nri.enabled=true\nmessaging.enabled=true\napia.auth.required=false\ndatabase.jdbcDriverClass=com.mysql.jdbc.Driver\ntomcat.ssl.port=8443\nssl.available=true\ndatabase.jdbcURL=jdbc:mysql://localhost/fedora3?useUnicode\=true&characterEncoding\=UTF-8&autoReconnect\=true\nmessaging.uri=vm:(broker:(tcp://localhost:61616))\ndatabase.password=islandora\ndatabase.mysql.driver=included\ndatabase.username=fedoraAdmin\nfesl.authz.enabled=false\ntomcat.shutdown.port=8055\ndeploy.local.services=true\nxacml.enabled=true\ndatabase.mysql.jdbcDriverClass=com.mysql.jdbc.Driver\ntomcat.http.port=8080\nfedora.serverHost=localhost\ndatabase=mysql\ndatabase.driver=included\nfedora.serverContext=fedora\nllstore.type=akubra-fs\ntomcat.home=/usr/local/fedora/tomcat\nfesl.authn.enabled=true\ndatabase.mysql.jdbcURL=jdbc:mysql://localhost/fedora3?useUnicode\=true&characterEncoding\=UTF-8&autoReconnect\=true\nfedora.home=/usr/local/fedora\ninstall.type=custom\nservlet.engine=included\napim.ssl.required=false\nfedora.admin.pass=islandora\napia.ssl.required=false' > ~/islandora-setup/install.properties

sed -i "s|localhost/fedora3?|localhost/$FEDORA_DB_NAME?|g" ~/islandora-setup/install.properties

sed -i "s|database.password=islandora|database.password=$FEDORA_DB_PASS|g" ~/islandora-setup/install.properties

sed -i "s|database.username=fedoraAdmin|database.username=$FEDORA_DB_USER|g" ~/islandora-setup/install.properties

sed -i "s|fedora.home=/usr/local/fedora|fedora.home=$FEDORA_HOME|g" ~/islandora-setup/install.properties

sed -i "s|tomcat.home=/usr/local/fedora/tomcat|tomcat.home=$CATALINA_HOME|g" ~/islandora-setup/install.properties sed -i "s|fedora.admin.pass=islandora|fedora.admin.pass=$FEDORA_ADMIN_PASS|g" ~/islandora-setup/install.properties

cd ~/islandora-setup

wget http://downloads.sourceforge.net/fedora-commons/fcrepo-installer-$FEDORA_VERSION.jar

java -jar fcrepo-installer-$FEDORA_VERSION.jar install.properties

rm -rf fcrepo-installer-$FEDORA_VERSION.jar install.properties

sed -i "s|changeme|islandora|g" $FEDORA_HOME/server/config/fedora.fcfg

# Tweak some fedora settings

sed -i 's|||g' $FEDORA_HOME/server/config/fedora.fcfg

sed -i 's|||g' $FEDORA_HOME/server/config/fedora.fcfg

sed -i 's|||g' $FEDORA_HOME/server/config/fedora.fcfg

sed -i "s|security.fesl.authN.jaas.apia.enabled=false|security.fesl.authN.jaas.apia.enabled=true|g" $FEDORA_HOME/server/config/spring/web/web.properties

# Adds Fedora User and adds fedora environment variables to /etc/profile.d/fedora.sh

FEDORA_USER_TEST=`getent passwd $FEDORA_USER`

if [ "$FEDORA_USER_TEST" = "" ]; then
    useradd -m -d $FEDORA_HOME -s /bin/false $FEDORA_USER
    # Make environment variables match with what we set above
    echo -e 'export FEDORA_HOME=/usr/local/fedora\nexport CATALINA_HOME=/usr/local/fedora/tomcat\nexport CATALINA_PID="$CATALINA_HOME/catalina.pid"\nexport JAVA_OPTS="-Xms1024m -Xmx1024m -XX:MaxPermSize=512m -XX:+CMSClassUnloadingEnabled -Djavax.net.ssl.trustStore=/usr/local/fedora/server/truststore -Djavax.net.ssl.trustStorePassword=tomcat"\nexport JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre\nexport FEDORA_USER=fedora' > /etc/profile.d/fedora.sh
    sed -i "s|JAVA_OPTS=\"-Xms1024m -Xmx1024m -XX:MaxPermSize=512m -XX:+CMSClassUnloadingEnabled -Djavax.net.ssl.trustStore=/usr/local/fedora/server/truststore -Djavax.net.ssl.trustStorePassword=tomcat\"|JAVA_OPTS=\"$JAVA_OPTS\"|g" /etc/profile.d/fedora.sh
    sed -i "s|FEDORA_HOME=\"/usr/local/fedora\"|FEDORA_HOME=\"$FEDORA_HOME\"|g" /etc/profile.d/fedora.sh
    sed -i "s|CATALINA_HOME=\"/usr/local/fedora/tomcat\"|CATALINA_HOME=\"$CATALINA_HOME\"|g" /etc/profile.d/fedora.sh
    sed -i "s|FEDORA_USER=fedora|FEDORA_USER=$FEDORA_USER|g" /etc/profile.d/fedora.sh
    sed -i "s|JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre|JAVA_HOME=$JAVA_HOME|g" /etc/profile.d/fedora.sh
else
    echo -e "fedora user already exists\n"
fi

# Note: make sure you check /etc/profile.d/fedora.sh to ensure everything has been generated properly. If it didn’t you may have closed your shell you may need to resource islandora-install.properties

chown -R $FEDORA_USER:$FEDORA_USER $FEDORA_HOME

# Create tomcat init.d startup script

cd /etc/init.d
wget --no-check-certificate https://raw.github.com/discoverygarden/Fedora-Init-Script/master/tomcat
ln -s tomcat fedora
chmod a+x tomcat
$SCHEDULE_TOMCAT_SERVICE_COMMAND
unzip -o $CATALINA_HOME/webapps/fedora.war -d $CATALINA_HOME/webapps/fedora

# Fix for fedora 3.7.1 -> note tagged file for 3.7.1 doesn’t seem to work
mkdir -p $CATALINA_HOME/webapps/fedora/WEB-INF/classes/org/fcrepo/server/storage/resources
cd $CATALINA_HOME/webapps/fedora/WEB-INF/classes/org/fcrepo/server/storage/resources
wget --no-check-certificate https://raw.githubusercontent.com/fcrepo3/fcrepo/6a4681c1229682d865f51ace194f20156ff48301/fcrepo-server/src/main/resources/dbspec/server/org/fcrepo/server/storage/resources/DefaultDOManager.dbspec
chown -R $FEDORA_USER:$FEDORA_USER $FEDORA_HOME

# Start and stop tomcat so fedora creates some dirs
service tomcat deploy
