#!/bin/bash

echo "Running 001"
./001-environment.sh &> ../log/remote-solr-001.log

echo "Running 002"
./002-os.sh &> ../log/remote-solr-002.log

echo "Running 003"
./003-java-tomcat.sh &> ../log/remote-solr-003.log

echo "Running 004"
./004-solr.sh &> ../log/remote-solr-004.log
