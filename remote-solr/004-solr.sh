#!/bin/bash

wget https://archive.apache.org/dist/lucene/solr/4.2.1/solr-4.2.1.zip
unzip solr-4.2.1.zip
mv solr-4.2.1 /usr/share/solr
cp /usr/share/solr/example/webapps/solr.war /usr/share/solr/example/solr/

echo '<?xml version="1.0" encoding="utf-8"?>
    <Context docBase="/usr/share/solr/example/solr/solr.war" debug="0" crossContext="true"> <Environment name="solr/home" type="java.lang.String" value="/usr/share/solr/example/solr" override="true" />
    </Context>' > /etc/tomcat7/Catalina/localhost/solr.xml

chown -R tomcat7 /usr/share/solr/example/solr

service tomcat7 restart
