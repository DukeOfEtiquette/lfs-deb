#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#prerequisites-gnulinux-debianubuntu
set -e

LFS_DIR=$HOME/lfs-deb

echo "### 00 Prerequisites- STARTING"

echo "Installing debootstrap"
sudo apt-get install debootstrap

echo "Creating directory $LFS_DIR"
mkdir -p $LFS_DIR

echo "### 00 Prerequisites - COMPLETE"