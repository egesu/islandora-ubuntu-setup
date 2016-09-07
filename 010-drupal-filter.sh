#!/bin/bash

source 001-environment.sh

cd $CATALINA_HOME/webapps/fedora/WEB-INF/lib

wget --no-check-certificate $DRUPAL_FILTER_URL

echo -e 'fedora-auth\n{\n\torg.fcrepo.server.security.jaas.auth.module.XmlUsersFileModule required\n\tdebug=true; \n\tca.upei.roblib.fedora.servletfilter.DrupalAuthModule required\n\tdebug=true; \n};\n\nfedora-auth-xmlusersfile\n{\n\torg.fcrepo.server.security.jaas.auth.module.XmlUsersFileModule required\n\tdebug=true;\n};\n\nfedora-auth-ldap-bind\n{\n\torg.fcrepo.server.security.jaas.auth.module.LdapModule required\n\thost.url="ldap://dev01.muradora.org"\n\tauth.type="simple"\n\tbind.mode="bind"\n\tbind.filter="uid={0},ou=people,dc=muradora,dc=org"\n\tdebug=true;\n};\n\nfedora-auth-ldap-bind-search-bind\n{\n\torg.fcrepo.server.security.jaas.auth.module.LdapModule required\n\thost.url="ldap://dev01.muradora.org"\n\tauth.type="simple"\n\tbind.mode="bind-search-bind"\n\tbind.user="uid=binduser,ou=people,dc=muradora,dc=org"\n\tbind.pass="murabind"\n\tsearch.base="ou=people,dc=muradora,dc=org"\n\tsearch.filter="(uid={0})"\n\tattrs.fetch="cn,sn,mail,displayName,carLicense"\n\tdebug=true;\n};\n\nfedora-auth-ldap-bind-search-compare\n{\n\torg.fcrepo.server.security.jaas.auth.module.LdapModule required\n\thost.url="ldap://dev01.muradora.org"\n\tauth.type="simple"\n\tbind.mode="bind-search-compare"\n\tbind.user="uid=binduser,ou=people,dc=muradora,dc=org"\n\tbind.pass="murabind"\n\tsearch.base="ou=people,dc=muradora,dc=org"\n\tsearch.filter="(uid={0})"\n\tattrs.fetch="cn,sn,mail,displayName,carLicense"\n\tdebug=true;\n};' > $FEDORA_HOME/server/config/jaas.conf

cd $FEDORA_HOME/server/config

wget https://raw.github.com/Islandora/islandora_drupal_filter/master/filter-drupal.xml

sed -i "s|DB_SERVER|$DB_SERVER|g" $FEDORA_HOME/server/config/filter-drupal.xml

sed -i "s|DRUPAL_DB_NAME|$DRUPAL_DB_NAME|g" $FEDORA_HOME/server/config/filter-drupal.xml

sed -i "s|DRUPAL_DB_USER|$DRUPAL_DB_USER|g" $FEDORA_HOME/server/config/filter-drupal.xml

sed -i "s|DRUPAL_DB_PASS|$DRUPAL_DB_PASS|g" $FEDORA_HOME/server/config/filter-drupal.xml

# Start fedora fully configured

chown -R $FEDORA_USER:$FEDORA_USER $FEDORA_HOME

service tomcat start
