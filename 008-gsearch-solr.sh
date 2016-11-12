#!/bin/bash

source 001-environment.sh

# Grab fedoragsearch and solr - do basic config

cd ~/islandora-setup

wget $FEDORA_GSEARCH_URL

unzip -o $FEDORA_GSEARCH_NAME.zip

cp $FEDORA_GSEARCH_NAME/fedoragsearch.war $CATALINA_HOME/webapps/ && unzip -o $FEDORA_GSEARCH_NAME/fedoragsearch.war -d $CATALINA_HOME/webapps/fedoragsearch && rm -rf $FEDORA_GSEARCH_NAME*

wget $SOLR_URL
tar -xf $SOLR_NAME.tgz
cp -r $SOLR_NAME/example/solr $FEDORA_HOME/solr
cp $SOLR_NAME/example/webapps/solr.war $CATALINA_HOME/webapps/ && unzip -o $SOLR_NAME/example/webapps/solr.war -d $CATALINA_HOME/webapps/solr
mkdir $FEDORA_HOME/solr/$SOLR_DEFAULT_CORE_PATH/data

chhown -R $FEDORA_USER:$FEDORA_USER $FEDORA_HOME

cd $CATALINA_HOME/webapps/fedoragsearch/FgsConfig

# Ant generateIndexingXslt

ant -f fgsconfig-basic.xml -Dlocal.FEDORA_HOME=$FEDORA_HOME -DgsearchUser=$FEDORA_ADMIN_USER -DgsearchPass=$FEDORA_ADMIN_PASS -DfinalConfigPath=$CATALINA_HOME/webapps/fedoragsearch/WEB-INF/classes -DlogFilePath=$FEDORA_HOME/server/logs -DfedoraUser=$FEDORA_ADMIN_USER -DfedoraPass=$FEDORA_ADMIN_PASS -DobjectStoreBase=$FEDORA_HOME/data/objectStore -DindexBase=$SOLR_BASE -DindexDir=$FEDORA_HOME/solr/$SOLR_DEFAULT_CORE_PATH/data/index -DindexingDocXslt=foxmlToSolr -propertyfile "fgsconfig-basic-for-islandora.properties"

mv $FEDORA_HOME/solr/$SOLR_DEFAULT_CORE_PATH/conf/schema.xml $FEDORA_HOME/solr/$SOLR_DEFAULT_CORE_PATH/conf/schema.xml.bak
mv $FEDORA_HOME/solr/$SOLR_DEFAULT_CORE_PATH/conf/solrconfig.xml $FEDORA_HOME/solr/$SOLR_DEFAULT_CORE_PATH/conf/solrconfig.xml.bak

mv $CATALINA_HOME/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/foxmlToSolr.xslt $CATALINA_HOME/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/foxmlToSolr.xslt.bak

# Solr Configuration

cd ~/islandora-setup

git clone --recursive git://github.com/discoverygarden/basic-solr-config.git
cd basic-solr-config
git checkout 4.x
mv ~/islandora-setup/basic-solr-config/conf/* $FEDORA_HOME/solr/$SOLR_DEFAULT_CORE_PATH/conf
mv ~/islandora-setup/basic-solr-config/islandora_transforms $CATALINA_HOME/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex
mv ~/islandora-setup/basic-solr-config/foxmlToSolr.xslt $CATALINA_HOME/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/foxmlToSolr.xslt
cp ~/islandora-setup/basic-solr-config/index.properties $CATALINA_HOME/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/index.properties
cd ~/islandora-setup
rm -rf ~/islandora-setup/basic-solr-config
rm -rf ~/islandora-setup/$SOLR_NAME*

cd $CATALINA_HOME/webapps/fedoragsearch/WEB-INF/lib

wget https://github.com/discoverygarden/dgi_gsearch_extensions/releases/download/v0.1.1/gsearch_extensions-0.1.1-jar-with-dependencies.jar -O gsearch_extensions-0.1.1-jar-with-dependencies.jar
