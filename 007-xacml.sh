#!/bin/bash

source 001-environment.sh

# Adjust xacml policies...

rm -rf $FEDORA_HOME/data/fedora-xacml-policies/repository-policies/default/deny-purge-*

rm -rf $FEDORA_HOME/data/fedora-xacml-policies/repository-policies/default/deny-inactive-or-deleted-objects-or-datastreams-if-not-administrator.xml

rm -rf $FEDORA_HOME/data/fedora-xacml-policies/repository-policies/default/deny-policy-management-if-not-administrator.xml

# Note this file should either be removed or tweaked if you wish to access fedoraAdmin. Keep in mind firewall rules would need to be updated as well.

rm -rf $FEDORA_HOME/data/fedora-xacml-policies/repository-policies/default/deny-apim-if-not-localhost.xml

cd ~

git clone https://github.com/Islandora/islandora-xacml-policies && cd islandora-xacml-policies

mkdir $FEDORA_HOME/data/fedora-xacml-policies/repository-policies/islandora_policies && cp *.xml $FEDORA_HOME/data/fedora-xacml-policies/repository-policies/islandora_policies && rm -rf ~/islandora-xacml-policies
