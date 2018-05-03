#!/bin/bash

# This script is necessary to set up the data disk that will 
# keep the docker image and serve as mount point

# The ARM script only mounts a single data disk.  It is safe 
# to assume that on a new VM, this data disk is located at /dev/sdc.

# If you have a more complicated setup, then do examine what this
# script is doing and modify accordingly.

# create a partition table for the disk
parted -s /dev/sdc mklabel msdos

# create a single large partition
parted -s /dev/sdc mkpart primary ext4 0\% 100\%

# install the file system
mkfs.ext4 /dev/sdc1

# create the mount point
mkdir /datadisk

# mount the disk
sudo mount /dev/sdc1 /datadisk/

# add mount to /etc/fstab to persist across reboots
echo "/dev/sdc1    /datadisk/    ext4    defaults 0 0" >> /etc/fstab

# install docker
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# install wget
sudo apt-get install wget

#get cloudera image
cd /datadisk
sudo wget https://downloads.cloudera.com/demo_vm/docker/cloudera-quickstart-vm-5.13.0-0-beta-docker.tar.gz
sudo tar --strip-components=1 -zxvf cloudera-quickstart-vm-5.13.0-0-beta-docker.tar.gz
sudo docker import - cloudera/cloudera:latest < /datadisk/cloudera-quickstart-vm-*-docker*.tar

# add the user to the docker gorup to execute docker without sudo
if [ "$1" != "" ]; then
    sudo usermod -aG docker $1 
else
    echo "not adding user to the docker group"
fi

