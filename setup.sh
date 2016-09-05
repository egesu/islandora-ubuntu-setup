#!/bin/bash

echo "Running 001"
./001-environment.sh >> log/001.log
echo "Running 002"
./002-os-upgrade.sh >> log/002.log
echo "Running 003"
./003-os-packages.sh >> log/003.log

echo "Running 004 dependencies"

echo "Running 004-d1"
./004-d1-ghostscript.sh &> log/004-d1.log

echo "Running 004-d2"
# ./004-d2-ffmpeg.sh &> log/004-d2.log

echo "Running 004-d3"
# ./004-d3-ffmpeg2theora.sh &> log/004-d3.log

echo "Running 004-d4"
./004-d4-fits.sh &> log/004-d4.log

echo "Running 004-d5"
./004-d5-drush.sh &> log/004-d5.log
