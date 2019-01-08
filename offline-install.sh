#! /bin/bash
cp /etc/apt/sources.list /etc/apt/sources.list-bkp
> /etc/apt/sources.list
echo "deb file:/usr/local/mydebs ./" > /etc/apt/sources.list
mv mydebs /usr/local/
cd /usr/local/mydebs
dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
apt-get update
###Revert
cp /etc/apt/sources.list-bkp /etc/apt/sources.list
