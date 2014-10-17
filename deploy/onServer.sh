#!/bin/sh

echo Starting etcd:
/usr/bin/coreos-cloudinit --from-file=/var/lib/coreos-install/user_data

echo Cloning the indiehosters repo into /data/indiehosters:
mkdir /data
cd /data
git clone https://github.com/indiehosters/indiehosters.git
cd indiehosters

echo Checking out $1 branch of the IndieHosters indiehosters:
git checkout $1
git pull

echo Running the server setup script:
sh scripts/setup.sh $2
