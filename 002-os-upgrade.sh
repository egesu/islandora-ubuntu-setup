#!/bin/bash

sed -i 's/tr.archive/archive/g' /etc/apt/sources.list

apt-get update && apt-get -y upgrade
