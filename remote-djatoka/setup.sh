#!/bin/bash

echo "Running 002"
./002-os.sh &> ../log/remote-djatoka-002.log

echo "Running 003"
./003-java-tomcat.sh &> ../log/remote-djatoka-003.log

echo "Running 004"
./004-djatoka.sh &> ../log/remote-djatoka-004.log
