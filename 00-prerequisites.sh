#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#prerequisites-gnulinux-debianubuntu
set -e

LFS_DIR=$HOME/lfs-deb

sudo apt-get install debootstrap
mkdir -p $LFS_DIR