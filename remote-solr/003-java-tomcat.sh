#!/bin/bash

apt-get -y install oracle-java8-installer tomcat7 tomcat7-admin unzip git
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre" >> /etc/default/tomcat7

if [[ $(cat /etc/tomcat7/tomcat-users.xml | grep admin) == "" ]]; then
    sed '40a\
             <role rolename="manager"/> \
             <role rolename="admin"/> \
             <role rolename="admin-gui"/> \
             <role rolename="manager-gui"/> \
             <user username="tomcat" password="tomcat" roles="manager,admin,manager-gui,admin-gui"/> \
    ' /etc/tomcat7/tomcat-users.xml
fi
