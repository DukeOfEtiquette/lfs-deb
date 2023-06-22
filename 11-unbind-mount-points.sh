#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#clean-up-the-chroot-environment
set -e

echo "### 11 Unbind mount points - STARTING"

sudo umount $HOME/lfs-deb/chroot/dev
sudo umount $HOME/lfs-deb/chroot/run

echo "### 11 Unbind mount points - COMPLETE"