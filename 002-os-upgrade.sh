#!/bin/bash

locale-gen "en_US.UTF-8"
dpkg-reconfigure locales

sed -i 's/tr.archive/archive/g' /etc/apt/sources.list

apt-get update && apt-get -y upgrade
